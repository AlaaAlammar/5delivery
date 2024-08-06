

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:tatbekat/register/register_service.dart';

class regester_screen_controller extends GetxController {


  var name;
  var email;
  var password;
  var password_confirmation;

  RegisterServices registerServices = RegisterServices();


   regesterOnClick () {
    registerServices.register
    (name, email, password, password_confirmation);
  }


}

