import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/global_widget/dial_appbar_controller.dart';
import 'package:whatsapp_clone/ui/dial_screen/dial_controller.dart';
import 'package:whatsapp_clone/ui/dial_screen/dial_screen.dart';

class DialAppbar extends StatelessWidget {
  DialAppbar({super.key});
  final controller = Get.put(DialController());
  final dialAppBarController = Get.put(DialAppbarController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(
      () => dialAppBarController.isExpanded.value
          ? GestureDetector(
              onTap: () {
                Get.to(() => DialScreen());
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                height: size.height * 0.15,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    _buildButton(
                      icon: "assets/icons/ic_voice.png",
                      onPressed: () {
                        Get.snackbar(
                          "Voice",
                          "Voice OnTap",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                        );
                      },
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.call, color: Colors.green, size: 18),
                        Text(
                          controller.userName,
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    _buildButton(
                      icon: "assets/icons/ic_call.png",
                      onPressed: () {
                        controller.stopTimer();
                        dialAppBarController.isExpanded.value = false;
                        Get.snackbar(
                          "Cancelled",
                          "Call Cancelled",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                        );
                      },
                      color: const Color.fromARGB(255, 255, 31, 15),
                    ),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }

  Widget _buildButton({
    required String icon,
    required VoidCallback onPressed,
    Color color = const Color.fromARGB(255, 87, 87, 87),
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: ClipOval(child: Image.asset(icon, fit: BoxFit.cover)),
      ),
    );
  }
}
