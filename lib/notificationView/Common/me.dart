// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FireBaseApi {
  late final FirebaseMessaging msg;
  void SettingNotrification() async {
    await msg.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }

  void ConnectNotrifc() async {
    await Firebase.initializeApp();
    msg = FirebaseMessaging.instance;
    msg.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );
    SettingNotrification();
    FirebaseMessaging.onBackgroundMessage(onBackgroundMsg);
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Get.snackbar(
          " ${event.notification?.title}", "${event.notification?.body}");
    });
    msg.getToken().then((value) {
      print("------------------ fcm token ------------------------");
      print("token : $value");
      print("-----------------------------------------------------");
    });
  }

  static Future<void> onBackgroundMsg(RemoteMessage event) async {
    await Firebase.initializeApp();
    print("on background msh: ${event.messageId}");
  }
}
