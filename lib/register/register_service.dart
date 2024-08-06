// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tatbekat/login/login_view.dart';
import 'package:tatbekat/utils/server_config.dart';

class RegisterServices {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);

  register(name, email, password, password_confirmation) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
    });

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 201) {
      Get.to(LogInScreen());
    } else {
      print('error');
    }
  }
}
