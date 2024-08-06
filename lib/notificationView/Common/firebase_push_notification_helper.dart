// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification?.title ?? "");
}

class PushNotificationHelper {
  static String fcmToken = "";
  static Future<void> initialized() async {
    await Firebase.initializeApp();
    if (Platform.isAndroid) {
      NotificationHelper.initialized();
    } else if (Platform.isIOS) {
      FirebaseMessaging.instance.requestPermission();
    }

    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    getDeviceTokenToSendNotification();
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("FirebaseMessaging.instance.getInitialMessage");
      if (message != null) {
        print("New Notification");
      }
    });
    FirebaseMessaging.onMessage.listen((message) {
      print("FirebaseMessaging.onMessage.listen");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print(message.data);

        NotificationHelper.displayNotification(message);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("FirebaseMessaging.onMessage.listen");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print(message.data);
      }
    });
  }

  static Future<String> getDeviceTokenToSendNotification() async {
    fcmToken = (await FirebaseMessaging.instance.getToken()).toString();
    print("FCM Token:$fcmToken");
    return fcmToken;
  }
}

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialized() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(android: initializationSettingsAndroid),
        onDidReceiveNotificationResponse: (details) {},
        onDidReceiveBackgroundNotificationResponse: localBackgroundHandler);
  }

  static void displayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch;
      const notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails("tatbekat", "tatbekat_channel",
              importance: Importance.max, priority: Priority.high));
      await flutterLocalNotificationsPlugin.show(
          id,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
          payload: message.data['_id'] ?? "");
    } on Exception catch (e) {
      print(e);
    }
  }
}

Future<void> localBackgroundHandler(NotificationResponse data) async {
  print(data.toString());
}
