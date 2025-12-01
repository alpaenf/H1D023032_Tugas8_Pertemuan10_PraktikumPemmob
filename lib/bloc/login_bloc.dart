import 'package:tokokita/helpers/api.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/login.dart';

class LoginBloc {
  static Future<Login> login({
    String? email,
    String? password,
  }) async {
    Uri apiUrl = ApiUrl.login(); // pakai () dan Uri
    var body = {"email": email, "password": password};

    var response = await Api().post(apiUrl.toString(), body);

    return Login.fromJson(response); // langsung response, tidak decode lagi
  }
}
