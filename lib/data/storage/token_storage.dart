import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void setToken(String? token) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('token', token ?? '');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    return token;
  }

  void deleteToken() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }
}
