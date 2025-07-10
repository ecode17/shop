<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;

class SupplierProductController extends Controller
{
    // 1) List produk milik supplier
    public function index()
    {
        $products = Product::where('supplier_id', auth()->id())
            ->with('category', 'images')
            ->get();
        return view('supplier.products.index', compact('products'));
    }

    // 2) Form tambah produk (tanpa stok)
    public function create()
    {
        $categories = Category::all();
        return view('supplier.products.create', compact('categories'));
    }

    // 3) Simpan produk baru (support multi-image)
    public function store(Request $request)
    {
        $product = Product::create([
            'supplier_id'   => auth()->id(),
            'category_id'   => $request->category_id,
            'nama_produk'   => $request->nama_produk,
            'harga_jual'    => $request->harga_jual,
            'deskripsi'     => $request->deskripsi,
        ]);

        // Simpan multi foto jika ada
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $img) {
                $product->images()->create([
                    'file_path' => $img->store('product_images', 'public')
                ]);
            }
        }

        return redirect()->route('supplier.products.index')
            ->with('success', 'Produk berhasil ditambahkan!');
    }

    // 4) Form edit produk supplier (tanpa stok)
    public function edit($id)
    {
        $product = Product::where('id', $id)
            ->where('supplier_id', auth()->id())
            ->firstOrFail();

        $categories = Category::all();

        return view('supplier.products.edit', compact('product', 'categories'));
    }

    // 5) Update produk (tanpa stok, support tambah gambar baru)
    public function update(Request $request, $id)
    {
        $product = Product::where('id', $id)
            ->where('supplier_id', auth()->id())
            ->firstOrFail();
            
        $product->update([
            'category_id'   => $request->category_id,
            'nama_produk'   => $request->nama_produk,
            'harga_jual'    => $request->harga_jual,
            'deskripsi'     => $request->deskripsi,
        ]);

        // Simpan foto tambahan jika ada
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $img) {
                $product->images()->create([
                    'file_path' => $img->store('product_images', 'public')
                ]);
            }
        }

        return redirect()->route('supplier.products.index')
            ->with('success', 'Produk berhasil diperbarui!');
    }

    // 6) Hapus produk
    public function destroy($id)
    {
        $product = Product::where('id', $id)
            ->where('supplier_id', auth()->id())
            ->firstOrFail();

        $product->delete();

        return redirect()->route('supplier.products.index')
            ->with('success', 'Produk berhasil dihapus!');
    }

    // 7) Lihat produk toko utama (referensi)
    public function produkToko()
    {
        $products = \App\Models\Product::with('supplier', 'images')
            ->get();
        return view('supplier.products.toko', compact('products'));
    }
}
