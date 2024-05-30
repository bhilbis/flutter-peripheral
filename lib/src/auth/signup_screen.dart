import 'dart:developer';
import 'package:flutter_peripheral/src/auth/auth_service.dart';
import 'package:flutter_peripheral/src/auth/login_screen.dart';
import 'package:get/get.dart';
// import 'package:auth_firebase/widgets/button.dart';
// import 'package:auth_firebase/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = AuthService();

  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
            const Text("Signup",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 50,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter Name",
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
              controller: _username,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                  hintText: "Enter Email",
                  labelText: "Email",
                  border: OutlineInputBorder()),
              controller: _email,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              controller: _password,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _signup,
              child: const Text("Signup"),
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Already have an account? "),
              InkWell(
                onTap: () => goToLogin(),
                child: const Text("Login", style: TextStyle(color: Colors.red)),
              )
            ]),
            const Spacer()
          ],
        ),
      ),
    );
  }

  void goToLogin() {
    Get.to(() => const LoginScreen(),
        duration: const Duration(milliseconds: 800),
        transition: Transition.leftToRight);
  }

  void _signup() async {
    final user = await _auth.createUserWithEmailAndPassword(
        _email.text, _password.text, _username.text);

    if (user != null) {
      log("User Created Successfully");
      goToLogin();
    } else {
      Get.snackbar(
        "Error",
        "Failed to create account",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
