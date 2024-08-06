// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tatbekat/allgroups/allgroups_view.dart';
import 'package:tatbekat/config/storage/storage.dart';
import 'package:tatbekat/constants.dart';
import 'package:tatbekat/login/login_controller.dart';
import 'package:tatbekat/mygroups/mygroups_service.dart';
import 'package:tatbekat/register/register_view.dart';

import '../components/custom_button.dart';
import '../components/custom_text_field.dart';

class LogInScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LogInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bac.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: greyshade200),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView(
                children: [
                  Image.asset(
                    'images/welcom.jpg',
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("تسجيل الدخول"),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    onChange: loginController.onEmailChanged,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    keyBoared: TextInputType.text,
                    lableText: 'البريد الالكتروني',
                    icon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChange: loginController.onPasswordChanged,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    keyBoared: TextInputType.text,
                    lableText: 'كلمة السر',
                    icon: const Icon(Icons.visibility),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    height: 50,
                    buttonColor: greyshade200,
                    width: MediaQuery.of(context).size.width * 0.98,
                    buttonName: "تسجيل الدخول",
                    onTap: () => {
                      onClickLogIn(),
                      print("login success"),
                    },
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Get.to(const RegisterScreen());
                    },
                    child: const Text(
                      'لا أملك حساب',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: greyshade200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onClickLogIn() async {
    await loginController.loginOnClick();
    if (loginController.logInStatus) {
      Get.to(const MyGroups());
    } else {
      print('error');
    }
    if (loginController.logInStatus &&
        storage.get<SharedPreferences>().getBool("isAdmin")!) {
      Get.to(const AllGroups());
    }
    // else if (loginController.logInStatus) {
    //   //Get.to(const Homepage());
    // }
    else {
      print('error');
    }
  }
}
