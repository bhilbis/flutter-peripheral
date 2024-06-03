import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter_peripheral/src/auth/auth_service.dart';
import 'package:flutter_peripheral/src/auth/signup_screen.dart';
import 'package:flutter_peripheral/src/view/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
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
            const Text("Login",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(height: 50),
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter Email",
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
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
              onPressed: _login,
              child: const Text("Login"),
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't have an account? "),
              InkWell(
                onTap: () => goToSignup(),
                child:
                    const Text("Signup", style: TextStyle(color: Colors.red)),
              )
            ]),
            const Spacer()
          ],
        ),
      ),
    );
  }

  void goToSignup() {
    Get.to(() => const SignupScreen(),
        duration: const Duration(milliseconds: 800),
        transition: Transition.rightToLeft);
  }

  void goToHome() {
    Get.offAll(() => const HomeScreen(),
        duration: const Duration(milliseconds: 800),
        transition: Transition.fadeIn);
  }

  _login() async {
    final email = _email.text;
    final password = _password.text;

    final user = await _auth.loginUserWithEmailAndPassword(email, password);

    if (user != null) {
      log("User Logged In");
      goToHome();
    } else {
      Get.snackbar(
        "Error",
        "Invalid email or password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    bool _isValidEmail(String email) {
      return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
    }
  }
}
