import 'package:tokokita/helpers/api.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/produk.dart';

class ProdukBloc {
  // Set ke true untuk mode offline (tanpa backend)
  static const bool offlineMode = true;
  
  // Dummy data untuk offline mode
  static List<Produk> _dummyData = [
    Produk(id: '1', kodeProduk: 'A001', namaProduk: 'Kamera', hargaProduk: 5000000),
    Produk(id: '2', kodeProduk: 'A002', namaProduk: 'Kulkas', hargaProduk: 2500000),
    Produk(id: '3', kodeProduk: 'A003', namaProduk: 'Mesin Cuci', hargaProduk: 2000000),
  ];

  static Future<List<Produk>> getProduks() async {
    if (offlineMode) {
      // Simulasi delay network
      await Future.delayed(const Duration(milliseconds: 500));
      return _dummyData;
    }
    
    Uri apiUrl = ApiUrl.produk();
    var response = await Api().get(apiUrl.toString());
    List<dynamic> listProduk = response['data'];
    List<Produk> produks = listProduk.map((p) => Produk.fromJson(p)).toList();
    return produks;
  }

  static Future<bool> addProduk({Produk? produk}) async {
    if (offlineMode) {
      await Future.delayed(const Duration(milliseconds: 500));
      // Generate ID baru
      int newId = _dummyData.length + 1;
      produk!.id = newId.toString();
      _dummyData.add(produk);
      return true;
    }
    
    Uri apiUrl = ApiUrl.produk();
    var body = {
      "kode_produk": produk!.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString(),
    };
    var response = await Api().post(apiUrl.toString(), body);
    return response['status'];
  }

  static Future<bool> updateProduk({required Produk produk}) async {
    if (offlineMode) {
      await Future.delayed(const Duration(milliseconds: 500));
      int index = _dummyData.indexWhere((p) => p.id == produk.id);
      if (index != -1) {
        _dummyData[index] = produk;
        return true;
      }
      return false;
    }
    
    Uri apiUrl = ApiUrl.produkById(int.parse(produk.id!));
    var body = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString(),
    };
    var response = await Api().put(apiUrl.toString(), body);
    return response['status'];
  }

  static Future<bool> deleteProduk({int? id}) async {
    if (offlineMode) {
      await Future.delayed(const Duration(milliseconds: 500));
      _dummyData.removeWhere((p) => p.id == id.toString());
      return true;
    }
    
    Uri apiUrl = ApiUrl.produkById(id!);
    var response = await Api().delete(apiUrl.toString());
    return response['status'];
  }
}
