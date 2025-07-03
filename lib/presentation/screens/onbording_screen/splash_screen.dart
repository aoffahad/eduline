import 'package:eduline/presentation/screens/onbording_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final SplashController _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset("images/car_image.png", height: 350),
                const SizedBox(height: 30),
                const Text(
                  "Theory test in my language",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                const Text(
                  "I must write the real test will be in English language and this app just helps you to understand the materials in your language",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                const CircularProgressIndicator(color: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
