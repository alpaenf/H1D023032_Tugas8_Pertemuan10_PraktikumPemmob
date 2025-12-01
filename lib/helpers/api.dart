import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tokokita/helpers/user_info.dart';
import 'app_exception.dart';

class Api {

  Future<dynamic> post(String url, dynamic data) async {
    var token = await UserInfo().getToken();
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json"
        },
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Tidak ada koneksi internet. Pastikan backend sudah running.');
    } catch (e) {
      throw FetchDataException('Error: ${e.toString()}');
    }
  }

  Future<dynamic> get(String url) async {
    var token = await UserInfo().getToken();
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json"
        },
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> put(String url, dynamic data) async {
    var token = await UserInfo().getToken();
    try {
      final response = await http.put(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json"
        },
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> delete(String url) async {
    var token = await UserInfo().getToken();
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json"
        },
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      case 422:
        throw UnprocessableEntityException(response.body);
      case 500:
      default:
        throw FetchDataException(
          'Server Error: Status Code ${response.statusCode}');
    }
  }
}
