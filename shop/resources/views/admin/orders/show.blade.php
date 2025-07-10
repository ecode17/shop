@extends('layouts.admin')
@section('breadcrumb')
<nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="{{ route('orders.index') }}">Transaksi Penjualan</a>
        </li>
        <li class="breadcrumb-item active" aria-current="page">
            Detail Transaksi
        </li>
    </ol>
</nav>
@endsection
@section('content')
@php
$wilayahTegal = [
'tegal', // Supaya semua alamat yg mengandung "tegal" (termasuk kota/kab) ikut
'kota tegal', 'kabupaten tegal',
'margadana', 'tegal barat', 'tegal timur', 'tegal selatan',
'slawi', 'dukuhturi', 'adiwerna', 'pangkah', 'kramat', 'talang', 'warureja', 'bojong',
'panggung tegal',
// Tambah kecamatan/kelurahan lain jika perlu
];
$alamatOrder = strtolower(trim($order->alamat_kirim ?? ($order->user->alamat ?? '')));
$isTegal = false;
foreach($wilayahTegal as $wilayah) {
if (strpos($alamatOrder, $wilayah) !== false) {
$isTegal = true;
break;
}
}
// Untuk dropdown & status tampil: jika status_order 'selesai' tapi isTegal true, status tampil jadi 'dikirim'
$statusTampil = $order->status_order;
if($order->status_order == 'selesai' && $isTegal){
$statusTampil = 'dikirim';
}
@endphp
<div class="row justify-content-center">
    <div class="col-lg-8 col-md-10">
        @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        @if($errors->any())
        <div class="alert alert-danger">{{ $errors->first() }}</div>
        @endif
        <div class="card mb-4">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5 class="mb-0"><i class="bx bx-receipt me-2"></i> Detail Transaksi</h5>
                <div>
                    <button onclick="printDiv('printable-area')" class="btn btn-info btn-sm me-1 d-print-none">
                        <i class="bx bx-printer"></i> Print
                    </button>
                    <a href="{{ route('orders.index') }}" class="btn btn-secondary btn-sm d-print-none">
                        <i class="bx bx-arrow-back"></i> Kembali
                    </a>
                </div>
            </div>
            <div class="card-body pb-1" id="printable-area">
                <div class="row mb-4">
                    <div class="col-md-6">
                        <ul class="list-unstyled mb-0">
                            <li>
                                <strong>No. Transaksi:</strong>
                                <span class="text-primary">{{ $order->midtrans_order_id ?? '-' }}</span>
                            </li>
                            <li>
                                <strong>Customer:</strong> {{ $order->user ? $order->user->name : '-' }}
                            </li>
                            <li>
                                <strong>Alamat Pengiriman:</strong>
                                <span>
                                    {{ $order->alamat_kirim ?? ($order->user->alamat ?? '-') }}
                                </span>
                            </li>
                            <li>
                                <strong>Status:</strong>
                                <span>
                                    @if($statusTampil == 'pending')
                                    <span class="badge bg-warning text-dark">Pending</span>
                                    @elseif($statusTampil == 'lunas')
                                    <span class="badge bg-success">Lunas</span>
                                    @elseif($statusTampil == 'dikirim')
                                    <span class="badge bg-info">Dikirim (Alamat: Tegal/Kabupaten Tegal)</span>
                                    @elseif($statusTampil == 'selesai')
                                    <span class="badge bg-secondary">Selesai (Otomatis, luar Tegal)</span>
                                    @else
                                    <span class="badge bg-secondary">{{ ucfirst($statusTampil) }}</span>
                                    @endif
                                </span>
                            </li>
                        </ul>

                        {{-- Form ubah status khusus admin --}}
                        @if(auth()->user()->role == 'admin')
                        <form method="POST" action="{{ route('orders.ubahStatus', $order->id) }}" class="mt-2 d-print-none">
                            @csrf
                            @method('PATCH')
                            <div class="input-group" style="max-width: 300px;">
                                <select name="status_order" class="form-select" required>
                                    <option value="pending" {{ $statusTampil == 'pending' ? 'selected' : '' }}>Pending</option>
                                    <option value="lunas" {{ $statusTampil == 'lunas' ? 'selected' : '' }}>Lunas</option>
                                    <option value="dikirim" {{ $statusTampil == 'dikirim' ? 'selected' : '' }}>Dikirim</option>
                                    <option value="selesai" {{ $statusTampil == 'selesai' ? 'selected' : '' }}>Selesai</option>
                                </select>
                                <button class="btn btn-outline-primary" type="submit">
                                    <i class="bx bx-refresh"></i> Ubah Status
                                </button>
                            </div>
                        </form>
                        @endif
                    </div>
                    <div class="col-md-6">
                        <ul class="list-unstyled mb-0">
                            <li><strong>Total:</strong> <span class="text-primary">Rp{{ number_format($order->total_order) }}</span></li>
                            <li><strong>Tanggal:</strong> {{ $order->created_at->format('d/m/Y H:i') }}</li>
                        </ul>
                    </div>
                </div>
                <div class="table-responsive mb-4">
                    <h6 class="fw-bold mb-2">Produk</h6>
                    <table class="table table-bordered table-sm align-middle">
                        <thead>
                            <tr class="table-light">
                                <th>Nama Produk</th>
                                <th>Qty</th>
                                <th>Harga</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($order->items as $item)
                            <tr>
                                <td>{{ $item->product->nama_produk }}</td>
                                <td>{{ $item->qty }}</td>
                                <td>Rp{{ number_format($item->harga_jual) }}</td>
                                <td>Rp{{ number_format($item->subtotal) }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                {{-- Tombol proses sesuai status --}}
                @if($statusTampil == 'pending')
                <form method="POST" action="{{ route('orders.pay', $order->id) }}" class="mb-2 d-print-none">
                    @csrf
                    <div class="row g-2 align-items-end">
                        <div class="col-md-4">
                            <label class="form-label">Pilih Metode Bayar:</label>
                            <select name="metode" class="form-select" required>
                                <option value="tunai">Tunai</option>
                                <option value="qris">QRIS</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <button class="btn btn-success mt-3 mt-md-0">
                                <i class="bx bx-credit-card"></i> Proses Pembayaran
                            </button>
                        </div>
                    </div>
                </form>
                @endif

                @if($statusTampil == 'lunas')
                <form method="POST" action="{{ route('orders.kirim', $order->id) }}" class="d-print-none">
                    @csrf
                    <button class="btn btn-primary mt-2">
                        <i class="bx bx-send"></i> Tandai Dikirim & Selesai
                    </button>
                </form>
                @endif

            </div>
        </div>
    </div>
</div>

{{-- Print script --}}
@push('scripts')
<script>
    function printDiv(divId) {
        window.print();
    }
</script>
@endpush

{{-- Print CSS --}}
<style>
    @media print {
        body * {
            visibility: hidden !important;
        }

        #printable-area,
        #printable-area * {
            visibility: visible !important;
        }

        #printable-area {
            position: absolute !important;
            left: 0;
            top: 0;
            width: 100%;
            box-shadow: none !important;
        }

        .d-print-none {
            display: none !important;
        }

        table,
        th,
        td {
            border: 1px solid #333 !important;
        }
    }
</style>
@endsection