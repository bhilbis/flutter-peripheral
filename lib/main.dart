import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_peripheral/src/auth/login_screen.dart';
import 'package:flutter_peripheral/src/view/screen/home_screen.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:get/get.dart';
import 'package:flutter_peripheral/core/app_theme.dart';
import 'package:flutter_peripheral/src/controller/office_peripheral_controller.dart';

Future<void> main() async {
  Get.put(OfficePeripheralController());

  // await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      home: const HomeScreen(),
      theme: AppTheme.lightTheme,
    );
  }
}
