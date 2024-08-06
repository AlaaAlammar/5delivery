// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:get/get.dart';
import 'package:tatbekat/login/login_service.dart';
import '../models/user.dart';

class LoginController extends GetxController {
  var email;
  var password;
  var logInStatus;
  late LoginServices services;

  void onEmailChanged(String value) => email.value = value;
  void onPasswordChanged(String value) => password.value = value;

  @override
  void onInit() {
    email = ''.obs;
    password = ''.obs;
    logInStatus = false;
    services = LoginServices();

    super.onInit();
  }

  Future<void> loginOnClick() async {
    User user = User(email: email.value, password: password.value);
    logInStatus = await services.login(user);

    print('bbb');

    if (password.value.isEmpty) {
      Get.snackbar('خطأ', 'الحقول فارغة');
      print('bbb');

      print(email.value);
      print(password.value);

      return;
    }

    if (!GetUtils.isEmail(email.value) ||
        (!email.value.contains('@') && !email.value.contains('.'))) {
      Get.snackbar('خطأ', 'البريد الالكتروني غير صالح');
      return;
    }
  }

  // void submit() {
  //   if (email.value == 'example@email.com' && password.value == 'password') {
  //     Get.to(const MyGroups());
  //   } else {
  //     Get.snackbar('خطأ', 'معلومات غير صحيحة');
  //   }
  // }
}
