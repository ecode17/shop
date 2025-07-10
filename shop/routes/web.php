<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{
    AuthController,
    CategoryController,
    ProductController,
    ProductImageController,
    SupplierController,
    MitraController,
    CustomerController,
    LaporanController,
    PurchaseController,
    OrderController,
    PaymentController,
    SupplierDashboardController,
    SupplierProductController,
    HomeController
};
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;

// =====================
// KATALOG & KERANJANG
// =====================
Route::get('/', [HomeController::class, 'katalog'])->name('home.katalog');
Route::get('/keranjang', [HomeController::class, 'keranjang'])->name('home.keranjang');
Route::post('/keranjang/tambah/{id}', [HomeController::class, 'tambahKeranjang'])->name('home.keranjang.tambah');
Route::post('/keranjang/hapus/{id}', [HomeController::class, 'hapusKeranjang'])->name('home.keranjang.hapus');
Route::post('/checkout', [HomeController::class, 'checkout'])->name('home.checkout');
Route::get('/checkout/success', fn() => view('home.checkout_success'))->name('home.checkout.success');
Route::get('/profile', fn() => view('home.profile'))->name('home.profile');
Route::get('/orders', [HomeController::class, 'pesananSaya'])->name('home.orders');

Route::middleware('auth')->prefix('myorders')->name('home.myorders.')->group(function () {
    Route::get('/', [HomeController::class, 'pesananSaya'])->name('index');
    Route::get('/{id}', [HomeController::class, 'pesananDetail'])->name('detail');
});

// =====================
// AUTH (register, login, logout)
// =====================
Route::get('register', fn() => view('auth.register'))->name('register');
Route::post('register', [AuthController::class, 'register']);
Route::get('login', fn() => view('auth.login'))->name('login');
Route::post('login', [AuthController::class, 'login']);
Route::post('logout', [AuthController::class, 'logout'])->name('logout');

// =====================
// DASHBOARD (dinamis redirect berdasarkan role)
// =====================
Route::get('/dashboard', function () {
    if (!auth()->check()) return redirect()->route('login');
    $role = auth()->user()->role;
    return match ($role) {
        'admin'    => redirect()->route('dashboard.admin'),
        'supplier' => redirect()->route('supplier.dashboard'),
        'mitra'    => redirect()->route('home.katalog'),
        'customer' => redirect()->route('home.katalog'),
        default    => abort(403, 'Role tidak dikenal'),
    };
});
Route::get('/dashboard/admin', [App\Http\Controllers\AdminDashboardController::class, 'index'])->name('dashboard.admin');

// =====================
// VERIFIKASI PENGGUNA BARU
// =====================
Route::get('users/verifikasi', [AuthController::class, 'verifikasi'])->name('users.verifikasi');
Route::post('users/{id}/approve', [AuthController::class, 'approve'])->name('users.approve');

// =====================
// KATEGORI PRODUK
// =====================
Route::resource('categories', CategoryController::class)->except(['show']);

// =====================
// PRODUK
// =====================
Route::resource('products', ProductController::class)->except(['show']);
// FOTO PRODUK
Route::post('products/{productId}/images', [ProductImageController::class, 'store'])->name('products.images.store');
Route::delete('product-images/{id}', [ProductImageController::class, 'destroy'])->name('products.images.destroy');

// =====================
// SUPPLIER (admin-only)
// =====================
Route::get('suppliers', [SupplierController::class, 'index'])->name('suppliers.index');
Route::post('suppliers/{id}/verify', [SupplierController::class, 'verify'])->name('suppliers.verify');
Route::get('suppliers/{id}/products', [SupplierController::class, 'products'])->name('suppliers.products');
Route::post('suppliers/{supplier_id}/order-product/{product_id}', [SupplierController::class, 'orderProduct'])->name('suppliers.orderProduct');
Route::get('suppliers/{id}/edit', [SupplierController::class, 'edit'])->name('suppliers.edit');
Route::put('suppliers/{id}', [SupplierController::class, 'update'])->name('suppliers.update');

// =====================
// MITRA (admin-only)
// =====================
Route::resource('mitras', MitraController::class)->only(['index', 'edit', 'update']);
Route::post('mitras/{id}/disable', [MitraController::class, 'disable'])->name('mitras.disable');

// =====================
// CUSTOMER (admin-only)
// =====================
Route::resource('customers', CustomerController::class)->only(['index', 'show']);

// =====================
// PEMBELIAN KE SUPPLIER (admin)
// =====================
Route::resource('purchases', PurchaseController::class)->only(['index', 'create', 'store', 'show']);

// =====================
// PENJUALAN / ORDER
// =====================
Route::resource('orders', OrderController::class)->only(['index', 'create', 'store', 'show']);
Route::post('orders/{id}/pay', [OrderController::class, 'pay'])->name('orders.pay');
Route::post('orders/{id}/kirim', [OrderController::class, 'kirim'])->name('orders.kirim');
Route::patch('orders/{id}/ubah-status', [OrderController::class, 'ubahStatus'])->name('orders.ubahStatus');

// =====================
// PEMBAYARAN
// =====================
Route::get('payments', [PaymentController::class, 'index'])->name('payments.index');
Route::post('payments/{id}/set-lunas', [PaymentController::class, 'setLunas'])->name('payments.setLunas');

// Midtrans: Buat Snap Token
Route::post('payments/create', [PaymentController::class, 'createTransaction'])->name('payments.create');

// Midtrans: Callback Handler
Route::post('payments/callback', [PaymentController::class, 'handleCallback'])
    ->withoutMiddleware([VerifyCsrfToken::class])
    ->name('payments.callback');

// =====================
// LAPORAN
// =====================
Route::prefix('laporan')->name('laporan.')->group(function () {
    Route::get('penjualan', [LaporanController::class, 'penjualan'])->name('penjualan');
    Route::get('produk-terlaris', [LaporanController::class, 'produkTerlaris'])->name('produk_terlaris');
    Route::get('pembelian', [LaporanController::class, 'pembelian'])->name('pembelian');
    Route::get('penjualan/pdf', [LaporanController::class, 'penjualanPdf'])->name('penjualan_pdf');
});

// =====================
// ROUTE SUPPLIER (middleware role supplier)
// =====================
Route::middleware(['auth', 'role:supplier'])
    ->prefix('supplier')
    ->name('supplier.')
    ->group(function () {
        Route::get('/dashboard', [SupplierDashboardController::class, 'index'])->name('dashboard');
        Route::get('products', [SupplierProductController::class, 'index'])->name('products.index');
        Route::get('products/create', [SupplierProductController::class, 'create'])->name('products.create');
        Route::post('products', [SupplierProductController::class, 'store'])->name('products.store');
        Route::get('products/{product}/edit', [SupplierProductController::class, 'edit'])->name('products.edit');
        Route::put('products/{product}', [SupplierProductController::class, 'update'])->name('products.update');
        Route::delete('products/{product}', [SupplierProductController::class, 'destroy'])->name('products.destroy');
        Route::get('products-toko', [SupplierProductController::class, 'produkToko'])->name('products.toko');

        Route::get('akun', [SupplierDashboardController::class, 'showAkun'])->name('akun.index');
        Route::get('akun/edit', [SupplierDashboardController::class, 'editAkun'])->name('akun.edit');
        Route::put('akun/update', [SupplierDashboardController::class, 'updateAkun'])->name('akun.update');
    });


// =====================
// Fallback
// =====================
Route::fallback(fn() => abort(404, 'Halaman tidak ditemukan.'));
