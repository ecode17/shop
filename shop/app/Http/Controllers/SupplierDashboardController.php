<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;

class SupplierDashboardController extends Controller
{
    public function index()
    {
        $supplierId = Auth::id();

        // Total produk milik supplier
        $totalProduk = Product::where('supplier_id', $supplierId)->count();

        // Produk menipis (stok <= 5)
        $produkMenipis = Product::where('supplier_id', $supplierId)
            ->where('stok', '<=', 5)
            ->orderBy('stok')
            ->get();

        // Contoh aktivitas (statik)
        $lastActivity = [
            "Update stok 'Kripik Kentang' - 3 Juni 2025",
            "Tambah produk 'Brownies Coklat' - 1 Juni 2025",
            "Edit harga 'Pia Keju' - 28 Mei 2025",
        ];

        return view('supplier.dashboard', compact('totalProduk', 'produkMenipis', 'lastActivity'));
    }

    public function showAkun()
    {
        $supplier = auth()->user();
        return view('supplier.account.index', compact('supplier'));
    }


    public function editAkun()
    {
        $supplier = auth()->user();
        return view('supplier.account.edit', compact('supplier'));
    }

    public function updateAkun(Request $request)
    {
        $supplier = auth()->user();
        $supplier->name  = $request->name;
        $supplier->email = $request->email;
        $supplier->phone = $request->phone;

        if ($request->filled('password')) {
            $supplier->password = bcrypt($request->password);
        }

        $supplier->save();

        return redirect()->route('supplier.account.edit')->with('success', 'Akun berhasil diperbarui.');
    }
}
