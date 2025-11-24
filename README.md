# Toko Kita

Aplikasi mobile untuk manajemen produk toko menggunakan Flutter.

## Deskripsi

Toko Kita adalah aplikasi Flutter yang memungkinkan pengguna untuk mengelola data produk toko. Aplikasi ini menyediakan fitur untuk melihat daftar produk, menambah produk baru, mengedit, dan menghapus produk.

## Fitur

- **Halaman Login**: Autentikasi pengguna untuk masuk ke aplikasi
- **Halaman Registrasi**: Pendaftaran pengguna baru
- **Daftar Produk**: Menampilkan semua produk yang tersedia
- **Detail Produk**: Melihat informasi lengkap produk (kode, nama, harga)
- **Tambah Produk**: Menambahkan produk baru ke dalam sistem
- **Edit Produk**: Mengubah informasi produk yang sudah ada
- **Hapus Produk**: Menghapus produk dari sistem

## Struktur Proyek

```
lib/
├── main.dart                 # Entry point aplikasi
├── model/
│   ├── login.dart           # Model data login
│   ├── produk.dart          # Model data produk
│   └── registrasi.dart      # Model data registrasi
└── ui/
    ├── login_page.dart      # Halaman login
    ├── registrasi_page.dart # Halaman registrasi
    ├── produk_page.dart     # Halaman daftar produk
    ├── produk_detail.dart   # Halaman detail produk
    └── produk_form.dart     # Halaman form tambah/edit produk
```

## Requirements

- Flutter SDK: ^3.9.2
- Dart SDK: ^3.9.2

## Instalasi

1. Clone repository ini:
```bash
git clone https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob.git
cd tokokita
```

2. Install dependencies:
```bash
flutter pub get
```

3. Jalankan aplikasi:
```bash
flutter run
```

## Model Data

### Produk
- `id`: String - ID unik produk
- `kodeProduk`: String - Kode produk
- `namaProduk`: String - Nama produk
- `hargaProduk`: int - Harga produk

## Penggunaan

1. **Melihat Daftar Produk**: Buka aplikasi untuk melihat semua produk
2. **Menambah Produk**: Klik ikon + di pojok kanan atas
3. **Melihat Detail**: Tap pada item produk di daftar
4. **Edit Produk**: Di halaman detail, klik tombol EDIT
5. **Hapus Produk**: Di halaman detail, klik tombol DELETE

## Screenshot

<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/detail_produk.png" width="250">
<img src="" width="250">
<img src="" width="250">
<img src="" width="250">
<img src="" width="250">

## Pengembangan

Aplikasi ini dikembangkan sebagai bagian dari:
- **Tugas**: Tugas 8
- **Pertemuan**: Pertemuan 10
- **Mata Kuliah**: Praktikum Pemrograman Mobile
- **NIM**: H1D023032

## Author

Alpaenf

## License

Proyek ini dibuat untuk keperluan akademik.
