import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatbekat/notificationView/home_view.dart';
import 'notificationView/Common/firebase_push_notification_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationHelper.initialized();

  //  WidgetsFlutterBinding.ensureInitialized();
  // final _service = FireBaseApi(); //it is very  imp. to write this code segment in try catch
  // try {
  //   _service.ConnectNotrifc(); //this code line provides to call all. 
  // } catch (e) {
  //   print('Error initializing Firebase: $e');
    // Handle Firebase initialization error gracefully
  // }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Push Notification',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomeView(),
    );
  }
}
