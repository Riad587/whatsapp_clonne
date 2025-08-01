import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/ui/dial_screen/dial_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                "Welcome to WhatsApp Clone",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => DialScreen());
                },
                icon: Icon(Icons.call, size: 50, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
