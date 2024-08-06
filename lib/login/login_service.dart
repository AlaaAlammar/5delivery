// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/storage/storage.dart';
 import '../models/user.dart';
import '../utils/server_config.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);
  var token;

  Future<bool> login(User user) async {
    var response = await http.post(url, body: {
      'email': user.email,
      'password': user.password,
    });

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      DateTime time = DateTime.now();
      print(time);
      var jsonResponse = jsonDecode(response.body);
      token = jsonResponse['token'];
      var userStore = jsonResponse['user_type'];

      storage.get<SharedPreferences>().setBool(
          "isUser",
          (userStore == "super_admin")
              ? false
              : true);
      storage.get<SharedPreferences>().setString("token", token);

      storage.get<SharedPreferences>().setBool(
          "isAdmin",
          (userStore == "User" )
              ? false
              : true);
      return true;
    } else if (response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }

}
