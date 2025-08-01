import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:whatsapp_clone/global_widget/dial_appbar.dart';
import 'package:whatsapp_clone/global_widget/dial_appbar_controller.dart';
import 'package:whatsapp_clone/ui/dial_screen/dial_screen.dart';
import 'package:whatsapp_clone/ui/splash_screen/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final dialAppBarController = Get.put(DialAppbarController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Obx(
          () => Column(
            children: [
              if (dialAppBarController.isExpanded.value) DialAppbar(),
              Expanded(child: SplashScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
