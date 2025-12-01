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

1. Halaman Login
<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/Cuplikan%20layar%202025-12-01%20210736.png" width="250">

2. Halaman Registrasi
<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/Cuplikan%20layar%202025-12-01%20210935.png" width="250">

3. Halaman List Produk
<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/Cuplikan%20layar%202025-12-01%20211143.png" width="250">

4. Halaman Tambah Produk
<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/Cuplikan%20layar%202025-12-01%20211504.png" width="250">

5. Halaman Ubah Produk
<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/Cuplikan%20layar%202025-12-01%20211716.png" width="250">

6. Halaman Detail Produk
<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/Cuplikan%20layar%202025-12-01%20211837.png" width="250">

7. Halaman Hapus Produk
<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/Cuplikan%20layar%202025-12-01%20211944.png" width="250">

8. Sidebar Logout
<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/sidebar.png" width="250">

9. Alert Login Tidak Diisi Field
<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/Cuplikan%20layar%202025-12-01%20212157.png" width="250">

10. Alert Registrasi Tidak Diisi Field
<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/Cuplikan%20layar%202025-12-01%20212312.png" width="250">

11. Alert Tambah Produk Tidak Diisi Field
<img src="https://github.com/alpaenf/H1D023032_Tugas8_Pertemuan10_PraktikumPemmob/blob/main/Cuplikan%20layar%202025-12-01%20212440.png" width="250">

## Pengembangan

Aplikasi ini dikembangkan sebagai bagian dari:
- **Tugas**: Tugas 8
- **Pertemuan**: Pertemuan 10
- **Mata Kuliah**: Praktikum Pemrograman Mobile
- **NIM**: H1D023032

## Author

Mukhammad Alfaen Fadillah

## License

Proyek ini dibuat untuk keperluan akademik.
