import 'dart:async';

import 'package:get/get.dart';

class DialController extends GetxController {
  final String userName = "Riad";
  final String userImage = 'assets/images/whatsapp_profile.png';
  final _seconds = 0.obs;
  Timer? _timer;

  @override
  onInit() {
    super.onInit();
    startTimer();
  }

  String get timeString {
    final minutes = (_seconds.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void startTimer() {
    _timer?.cancel();
    print("Timer started");
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _seconds.value++;
    });
  }

  void resetTimer() {
    _timer?.cancel();
    _seconds.value = 0;
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
