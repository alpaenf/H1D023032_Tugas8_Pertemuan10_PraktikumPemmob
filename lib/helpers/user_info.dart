import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  Future<bool> setToken(String value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString("token", value);
  }

  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  Future<bool> setUserID(int value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setInt("userID", value);
  }

  Future<int?> getUserID() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt("userID");
  }

  Future<void> logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear(); // Pastikan menunggu proses selesai
  }
}
