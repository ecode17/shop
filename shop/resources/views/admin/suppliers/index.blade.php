@extends('layouts.admin')
@section('breadcrumb')
<nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb">
        <li class="breadcrumb-item active" aria-current="page">
            Supplier
        </li>
    </ol>
</nav>
@endsection
@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0">Daftar Supplier</h5>
            </div>
            <div class="card-body">
                @if(session('success'))
                <div class="alert alert-success alert-dismissible" role="alert">
                    {{ session('success') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                @endif

                <div class="table-responsive text-nowrap">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th style="width:60px;">#</th>
                                <th>Nama Supplier</th>
                                <th>Email</th>
                                <th>Status</th>
                                <th>Produk</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($suppliers as $i => $s)
                            <tr>
                                <td>{{ $i+1 }}</td>
                                <td>{{ $s->name }}</td>
                                <td>{{ $s->email }}</td>
                                <td>
                                    @if($s->is_active)
                                    <span class="badge bg-label-success me-1">Aktif</span>
                                    @else
                                    <span class="badge bg-label-warning me-1">Pending</span>
                                    @endif
                                </td>
                                <td>
                                    <a href="{{ route('suppliers.products', $s->id) }}" class="btn btn-info btn-sm">
                                        <i class="bx bx-package"></i> Lihat Produk
                                    </a>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="6" class="text-center text-muted">Belum ada supplier.</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection