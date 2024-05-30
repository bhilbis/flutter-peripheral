import 'package:flutter/material.dart';
import 'package:flutter_peripheral/src/view/screen/onboarding_screen.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_peripheral/firebase_options.dart';
import 'package:flutter_peripheral/core/app_theme.dart';
import 'package:flutter_peripheral/src/controller/office_peripheral_controller.dart';

Future<void> main() async {
  Get.put(OfficePeripheralController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: const OnboardingScreen(),
      theme: AppTheme.lightTheme,
    );
  }
}
