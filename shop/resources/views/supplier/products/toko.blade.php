@extends('layouts.supplier') {{-- Pastikan ini layout supplier, atau edit ke layouts.admin sesuai kebutuhan --}}
@section('breadcrumb')
<nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb">
        <li class="breadcrumb-item active" aria-current="page">
            Produk Toko Utama
        </li>
    </ol>
</nav>
@endsection
@section('content')
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0"><i class="bx bx-store me-2"></i> Produk Toko Saya</h5>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th style="width: 60px;">#</th>
                        <th>Nama Produk</th>
                        <th>Supplier</th>
                        <th>Harga Jual</th>
                        <th>Stok</th>
                        <th>Deskripsi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($products as $i => $p)
                    <tr>
                        <td>{{ $i + 1 }}</td>
                        <td>{{ $p->nama_produk }}</td>
                        <td>{{ $p->supplier->name ?? '-' }}</td>
                        <td>Rp{{ number_format($p->harga_jual, 0, ',', '.') }}</td>
                        <td>{{ $p->stok }}</td>
                        <td>{{ Str::limit($p->deskripsi, 30) }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="7" class="text-center text-muted">Belum ada produk di toko.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection