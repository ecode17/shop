<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\PurchaseItem;
use App\Models\Supplier;
use App\Models\Product;
use App\Models\ProductClone;
use Illuminate\Support\Facades\DB;

class PurchaseController extends Controller
{
    public function index()
    {
        if (auth()->user()->role !== 'admin') abort(403);
        $purchases = Purchase::with('supplier')->get();
        return view('admin.purchase.index', compact('purchases'));
    }

    public function create()
    {
        if (auth()->user()->role !== 'admin') abort(403);
        $suppliers = Supplier::all();
        $products = Product::whereNotNull('supplier_id')->get();
        return view('purchase.create', compact('suppliers', 'products'));
    }

    public function store(Request $request)
    {
        if (auth()->user()->role !== 'admin') abort(403);

        // Validasi
        $request->validate([
            'supplier_id' => 'required|exists:suppliers,id',
            'product_ids' => 'required|array',
            'qtys'       => 'required|array',
            // harga_jual_toko opsional: jika input harga jual toko dari form
            // 'harga_jual_tokos' => 'array',
        ]);

        DB::transaction(function () use ($request) {
            $purchase = Purchase::create([
                'supplier_id' => $request->supplier_id,
                'tanggal_beli' => now(),
                'total_beli' => 0,
                'status_bayar' => 'belum'
            ]);
            $total = 0;
            foreach ($request->product_ids as $idx => $pid) {
                $qty = $request->qtys[$idx];
                $prod = Product::find($pid);

                // Harga beli diambil dari harga jual produk supplier
                $hargaBeli = $prod->harga_jual;
                $subtotal = $hargaBeli * $qty;

                $purchase->items()->create([
                    'product_id' => $pid,
                    'qty' => $qty,
                    'harga_satuan' => $hargaBeli,
                    'subtotal' => $subtotal
                ]);
                $total += $subtotal;

                // CLONE ke produk toko jika produk dari supplier
                if ($prod->supplier_id) {
                    // harga_jual toko bisa diinput dari $request (misal: $request->harga_jual_tokos[$idx])
                    $hargaJualToko = $request->harga_jual_tokos[$idx] ?? ($hargaBeli * 1.2); // default markup 20%

                    $prodClone = $prod->replicate(['stok', 'supplier_id', 'harga_jual', 'harga_beli']); // exclude
                    $prodClone->supplier_id = null;
                    $prodClone->stok = $qty;
                    $prodClone->harga_beli = $hargaBeli;
                    $prodClone->harga_jual = $hargaJualToko;
                    $prodClone->save();

                    ProductClone::create([
                        'original_product_id' => $prod->id,
                        'cloned_product_id' => $prodClone->id,
                        'admin_id' => auth()->user()->id
                    ]);
                }
            }
            $purchase->update(['total_beli' => $total]);
        });
        return redirect()->route('purchases.index')->with('success', 'Pembelian disimpan');
    }

    public function show($id)
    {
        if (auth()->user()->role !== 'admin') abort(403);
        $purchase = Purchase::with('items.product')->findOrFail($id);
        return view('purchase.show', compact('purchase'));
    }
}
