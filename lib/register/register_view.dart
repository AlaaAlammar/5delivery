// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatbekat/components/custom_button.dart';
import 'package:tatbekat/components/custom_text_field.dart';
import 'package:tatbekat/login/login_view.dart';
import 'package:tatbekat/register/register_controller.dart';
import '../../constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final regester_screen_controller registrationController =
      Get.put(regester_screen_controller());

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
                  border: Border.all(color: greyshade200), color: Colors.white),
              width: MediaQuery.of(context).size.width * 0.4,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/welcom.jpg',
                        // width: 200,
                        // height: 200,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("إنشاء حساب"),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          keyBoared: TextInputType.text,
                          lableText: 'الاسم',
                          onChange: (value) {
                            registrationController.name = value;
                          },
                          icon: const Icon(
                              Icons.drive_file_rename_outline_outlined)),
                      const SizedBox(height: 16),
                      CustomTextField(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          keyBoared: TextInputType.emailAddress,
                          lableText: 'البريد الالكتروني',
                          onChange: (value) {
                            registrationController.email = value;
                          },
                          icon: const Icon(Icons.email_outlined)),
                      const SizedBox(height: 16),
                      CustomTextField(
                          //width: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          keyBoared: TextInputType.visiblePassword,
                          lableText: "كلمة السر",
                          onChange: (value) {
                            registrationController.password = value;
                          },
                          icon: const Icon(Icons.visibility)),
                      const SizedBox(height: 16),
                      CustomTextField(
                          // width: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          keyBoared: TextInputType.visiblePassword,
                          lableText: "تأكيد كلمة السر",
                          onChange: (value) {
                            registrationController.password_confirmation =
                                value;
                          },
                          icon: const Icon(Icons.visibility)),
                      const SizedBox(height: 16),
                      CustomButton(
                        buttonColor: greyshade200,
                        onTap: () => onClickRegister(),
                        buttonName: 'إنشاء حساب',
                        height: 50,
                        //width: MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width * 0.98,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(LogInScreen());
                            },
                            child: const Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: greyshade200),
                            ),
                          ),
                          const Text('هل تملك حساب بالفعل؟ '),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onClickRegister() async {
    await registrationController.regesterOnClick();
    print("register");
  }
}
