@extends('layouts.supplier')
@section('breadcrumb')
<nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="{{ route('supplier.dashboard') }}">Dashboard</a>
        </li>
        <li class="breadcrumb-item active" aria-current="page">
            Profil Akun
        </li>
    </ol>
</nav>
@endsection

@section('content')
<div class="card">
    <div class="card-header">
        <h5>Informasi Akun</h5>
    </div>
    <div class="card-body">
        <p><strong>Nama:</strong> {{ $supplier->name }}</p>
        <p><strong>Email:</strong> {{ $supplier->email }}</p>
        <p><strong>Telepon:</strong> {{ $supplier->phone ?? '-' }}</p>

        <a href="{{ route('supplier.akun.edit') }}" class="btn btn-warning mt-3">Edit Akun</a>
    </div>
</div>
@endsection