import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nectar_groceries/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/color_extension.dart';
import 'common/my_http_overrides.dart';

SharedPreferences? prefs;

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // I am just loading my own environment variables.
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 5.0
    ..progressColor = TColor.primaryText
    ..backgroundColor = TColor.primary
    ..indicatorColor = Colors.yellow
    ..textColor = TColor.primaryText
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Online Groceries',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Gilroy",
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      home: const SplashView(),
      builder: (context, child) {
        return FlutterEasyLoading(child: child);
      },
    );
  }
}
