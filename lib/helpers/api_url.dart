class ApiUrl {
  // ========== KONFIGURASI API ==========
  // Pilih salah satu sesuai environment:
  
  // Untuk Web (Chrome/Firefox)
  static const String _host = "localhost";
  static const String _port = "8000"; // default Laravel: 8000
  
  // Untuk Android Emulator (uncomment jika pakai Android emulator)
  // static const String _host = "10.0.2.2";
  // static const String _port = "8000";
  
  // Untuk Android Device Real atau jaringan lain (ganti dengan IP komputer backend)
  // static const String _host = "192.168.1.100"; // ganti dengan IP komputer Anda
  // static const String _port = "8000";
  
  static const String _path = "/tokokita/public";

  static Uri registrasi() => Uri.http("$_host:$_port", "$_path/registrasi");
  static Uri login() => Uri.http("$_host:$_port", "$_path/login");
  static Uri produk() => Uri.http("$_host:$_port", "$_path/produk");
  static Uri produkById(int id) => Uri.http("$_host:$_port", "$_path/produk/$id");
}
