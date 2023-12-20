import '../../battery_alert.dart';

class AlarmSettingsController extends GetxController {
  static final instance = Get.find<AlarmSettingsController>();

  bool isSwitched = false;

  //*
  double currentSliderValue = 30;
  swithFunc(value) {
    currentSliderValue = value;
  }
}
