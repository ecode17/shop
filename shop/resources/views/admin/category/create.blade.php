@extends('layouts.admin')
@section('breadcrumb')
<nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="{{ route('categories.index') }}">Kategori</a>
        </li>
        <li class="breadcrumb-item active" aria-current="page">
            Tambah Kategori
        </li>
    </ol>
</nav>
@endsection
@section('content')
<div class="row justify-content-center">
    <div class="col-md-6">
        <div class="card mb-4">
            <h5 class="card-header">Tambah Kategori</h5>
            <div class="card-body">
                <form method="POST" action="{{ route('categories.store') }}">
                    @csrf
                    <div class="mb-3">
                        <label for="nama_kategori" class="form-label">Nama Kategori</label>
                        <input type="text" name="nama_kategori" id="nama_kategori"
                            class="form-control @error('nama_kategori') is-invalid @enderror"
                            value="{{ old('nama_kategori') }}" required placeholder="Contoh: Minuman">
                        @error('nama_kategori')
                        <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="d-flex justify-content-end">
                        <a href="{{ route('categories.index') }}" class="btn btn-outline-secondary me-2">
                            <i class="bx bx-arrow-back"></i> Batal
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="bx bx-save"></i> Simpan
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection