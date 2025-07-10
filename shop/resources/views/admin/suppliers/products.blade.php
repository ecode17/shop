@extends('layouts.admin')
@section('breadcrumb')
<nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="{{ route('suppliers.index') }}">Supplier</a>
        </li>
        <li class="breadcrumb-item active" aria-current="page">
            Produk
        </li>
    </ol>
</nav>
@endsection
@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">
                    <i class="bx bx-package me-2"></i> Produk dari {{ $supplier->name }}
                </h5>
                <a href="{{ route('suppliers.index') }}" class="btn btn-outline-secondary btn-sm">
                    <i class="bx bx-arrow-back"></i> Kembali
                </a>
            </div>
            <div class="card-body">
                @if(session('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bx bx-check-circle me-2"></i> {{ session('success') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                @endif

                <div class="table-responsive text-nowrap">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th style="width:60px;">#</th>
                                <th>Foto</th>
                                <th>Nama Produk</th>
                                <th>Harga Supplier</th>
                                <th>Beli (Qty)</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($products as $i => $p)
                            <tr>
                                <td>{{ $i+1 }}</td>
                                <td>
                                    @if($p->images->count())
                                    <img src="{{ asset('storage/' . $p->images->first()->file_path) }}" alt="Foto Produk" width="60" height="60" style="object-fit:cover; border-radius:8px;">
                                    @else
                                    <span class="text-muted">-</span>
                                    @endif
                                </td>
                                <td>{{ $p->nama_produk }}</td>
                                <td>Rp{{ number_format($p->harga_jual,0,',','.') }}</td>
                                <td>
                                    <form method="POST" action="{{ route('suppliers.orderProduct', [$supplier->id, $p->id]) }}" class="d-flex align-items-center gap-2">
                                        @csrf
                                        <input type="number" name="qty" min="1" value="1" class="form-control form-control-sm" style="width:80px;" required>
                                </td>
                                <td>
                                    <button type="submit" class="btn btn-success btn-sm">
                                        <i class="bx bx-cart-add"></i> Pesan
                                    </button>
                                    </form>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="5" class="text-center text-muted">Belum ada produk dari supplier ini.</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
                <div class="modal fade" id="fotoModal" tabindex="-1" aria-labelledby="fotoModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content">
                            <div class="modal-header py-2">
                                <h5 class="modal-title" id="fotoModalLabel">Detail Foto Produk</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body text-center">
                                <img src="" id="modalFotoProduk" style="max-width:100%; max-height:60vh; border-radius:10px;" alt="Foto Produk Besar">
                                <div id="fotoProdukList" class="mt-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection