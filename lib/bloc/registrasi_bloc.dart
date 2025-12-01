import 'dart:developer' as developer;
import 'package:tokokita/helpers/api.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/registrasi.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {String? nama, String? email, String? password}) async {
    Uri apiUrl = ApiUrl.registrasi();
    var body = {"nama": nama, "email": email, "password": password};

    developer.log('Registrasi URL: ${apiUrl.toString()}');
    developer.log('Registrasi body: $body');

    try {
      var response = await Api().post(apiUrl.toString(), body);
      developer.log('Registrasi response: $response');
      return Registrasi.fromJson(response);
    } catch (e) {
      developer.log('Registrasi error: $e');
      rethrow;
    }
  }
}
