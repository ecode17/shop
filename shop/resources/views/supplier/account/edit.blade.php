@extends('layouts.supplier')
@section('breadcrumb')
<nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="{{ route('supplier.account.index') }}">Profil Akun</a>
        </li>
        <li class="breadcrumb-item active" aria-current="page">
            Edit Akun
        </li>
    </ol>
</nav>
@endsection

@section('content')
<div class="card">
    <div class="card-header">
        <h5>Edit Akun</h5>
    </div>
    <div class="card-body">
        @if (session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        <form action="{{ route('supplier.akun.update') }}" method="POST">
            @csrf
            @method('PUT')

            <div class="mb-3">
                <label>Nama</label>
                <input type="text" name="name" class="form-control" value="{{ old('name', $supplier->name) }}" required>
            </div>

            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" value="{{ old('email', $supplier->email) }}" required>
            </div>

            <div class="mb-3">
                <label>No. Telepon</label>
                <input type="text" name="phone" class="form-control" value="{{ old('phone', $supplier->phone) }}">
            </div>

            <div class="mb-3">
                <label>Password Baru (Opsional)</label>
                <input type="password" name="password" class="form-control">
            </div>

            <div class="mb-3">
                <label>Konfirmasi Password Baru</label>
                <input type="password" name="password_confirmation" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
            <a href="{{ route('supplier.akun.index') }}" class="btn btn-secondary">Batal</a>
        </form>
    </div>
</div>
@endsection