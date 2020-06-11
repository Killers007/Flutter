import 'dart:io';

import 'route/navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:dio/dio.dart';

void main() => runApp(SampleApp());

class SampleApp extends StatelessWidget {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    // super.initState();
    print('TESTING INIT');
  }

  void initDIO() {
    // Dio dio = new Dio(); // with default Options

    // dio.options.baseUrl = "https://git.ulm.ac.id/pwa-absen";
    // dio.options.connectTimeout = 5000; //5s
    // dio.options.receiveTimeout = 3000;

    BaseOptions options = new BaseOptions(
      baseUrl: "https://git.ulm.ac.id/pwa-absen",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = new Dio(options);
    print('INT DIO');
  }

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token) {
      print('TOKEN');
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    firebaseCloudMessaging_Listeners();
    initDIO();

    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'Latihan Hello',
      home: BottomNavigationBarController(),
    );
  }
}
