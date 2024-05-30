// import 'package:flutter/material.dart';
// import 'package:flutter_peripheral/src/view/screen/home_screen.dart';
// import 'package:flutter_peripheral/src/auth/login_screen.dart';
// import 'package:flutter_peripheral/src/auth/auth_service.dart';

// class Widgetree extends StatefulWidget {
//   const Widgetree({super.key});

//   @override
//   State<Widgetree> createState() => _WidgetreeState();
// }

// class _WidgetreeState extends State<Widgetree> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: AuthService().authStateChange,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return const HomeScreen();
//         } else {
//           return const LoginScreen();
//         }
//       },
//     );
//   }
// }
