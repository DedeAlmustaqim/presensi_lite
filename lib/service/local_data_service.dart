import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DB {
  static late SharedPreferences db;

  static init() async {
    db = await SharedPreferences.getInstance();
    getUserId();
  }

  static setPrivacy(bool privacy) {
    db.setBool("privacy", privacy);
  }

  static bool? getPrivacy() {
    return db.getBool("privacy");
  }

  static setToken(String token) {
    db.setString("token", token);
  }

  static setId(int id) {
    db.setInt("id_user", id);
  }

  static String? getToken() {
    return db.getString("token");
  }

  static clearDatabase() async {
    await db.clear();
  }

  static setUser(Map currentUser) {
    db.setString("current_user", jsonEncode(currentUser));
  }

  static Map<String, dynamic>? getUser() {
    var jsonString = db.getString("current_user");
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }

  static set(String key, String value) {
    db.setString(key, value);
  }

  static String? get(String key) {
    return db.getString(key);
  }

  static int? getUserId() {
    return db.getInt('id_user');
  }
}
