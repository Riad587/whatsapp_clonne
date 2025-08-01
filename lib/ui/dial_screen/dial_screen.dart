import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/global_widget/dial_appbar_controller.dart';
import 'package:whatsapp_clone/ui/dial_screen/dial_controller.dart';

class DialScreen extends StatelessWidget {
  DialScreen({super.key});
  final controller = Get.put(DialController());
  final dialAppbarController = Get.put(DialAppbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/whatspp_bg_dark.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildButton(
                    icon: "assets/icons/ic_minimize.png",
                    onPressed: () {
                      dialAppbarController.isExpanded.value = true;
                      Get.back();
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        controller.userName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Obx(
                        () => Text(
                          controller.timeString,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildButton(
                    icon: "assets/icons/ic_add.png",
                    onPressed: () {
                      Get.snackbar(
                        "Added",
                        "Contact Added",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.white,
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        controller.userImage.isEmpty
                            ? 'assets/images/whatsapp_profile.png'
                            : controller.userImage,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 41, 41, 41),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(
                      icon: "assets/icons/ic_dot.png",
                      onPressed: () {
                        Get.snackbar(
                          "Option",
                          "Expand the Option",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                        );
                      },
                    ),
                    _buildButton(
                      icon: "assets/icons/ic_video.png",
                      onPressed: () {
                        Get.snackbar(
                          "Video",
                          "Video OnTap",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                        );
                      },
                    ),
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
                    _buildButton(
                      icon: "assets/icons/ic_speaker.png",
                      onPressed: () {
                        Get.snackbar(
                          "Speaker",
                          "Speaker OnTap",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                        );
                      },
                    ),
                    _buildButton(
                      icon: "assets/icons/ic_call.png",
                      onPressed: () {
                        controller.stopTimer();
                        Get.snackbar(
                          "Canceled",
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
            ],
          ),
        ),
      ),
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
