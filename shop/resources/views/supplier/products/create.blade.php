@extends('layouts.supplier')
@section('breadcrumb')
<nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="{{ route('supplier.products.index') }}">Produk Saya</a>
        </li>
        <li class="breadcrumb-item active" aria-current="page">
            Tambah Produk
        </li>
    </ol>
</nav>
@endsection

@section('content')
<div class="container">
    <h1>Tambah Produk</h1>
    <form action="{{ route('supplier.products.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="mb-3">
            <label>Foto Produk</label>
            <input type="file" name="images[]" class="form-control @error('images') is-invalid @enderror @error('images.*') is-invalid @enderror" multiple>
            @error('images') <div class="invalid-feedback">{{ $message }}</div> @enderror
            @error('images.*') <div class="invalid-feedback">{{ $message }}</div> @enderror
        </div>
        <div class="mb-3">
            <label>Kategori</label>
            <select name="category_id" class="form-select @error('category_id') is-invalid @enderror">
                <option value="">- Pilih Kategori -</option>
                @foreach($categories as $category)
                <option value="{{ $category->id }}" {{ old('category_id')==$category->id ? 'selected':'' }}>
                    {{ $category->nama_kategori }}
                </option>
                @endforeach
            </select>
            @error('category_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
        </div>
        <div class="mb-3">
            <label>Nama Produk</label>
            <input type="text" name="nama_produk" class="form-control @error('nama_produk') is-invalid @enderror" value="{{ old('nama_produk') }}">
            @error('nama_produk') <div class="invalid-feedback">{{ $message }}</div> @enderror
        </div>
        <div class="mb-3">
            <label>Harga Jual</label>
            <input type="number" name="harga_jual" class="form-control @error('harga_jual') is-invalid @enderror" value="{{ old('harga_jual') }}">
            @error('harga_jual') <div class="invalid-feedback">{{ $message }}</div> @enderror
        </div>
        <div class="mb-3">
            <label>Deskripsi</label>
            <textarea name="deskripsi" class="form-control @error('deskripsi') is-invalid @enderror">{{ old('deskripsi') }}</textarea>
            @error('deskripsi') <div class="invalid-feedback">{{ $message }}</div> @enderror
        </div>
        <button type="submit" class="btn btn-success">Simpan</button>
        <a href="{{ route('supplier.products.index') }}" class="btn btn-secondary">Batal</a>
    </form>
</div>
@endsection