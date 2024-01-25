import '../../battery_alert.dart';

class HomeController extends GetxController {
  static final instance = Get.find<HomeController>();

  int calculateCapacityInMilliampereHours(int? capacity, int? voltage) {
    if (capacity != null &&
        voltage != null &&
        capacity != -1 &&
        voltage != -1) {
      return (voltage * capacity) ~/ 1000; // Using ~/ for integer division
    } else {
      return 0;
    }
  }

  //*AnimationSwitch
  bool animationBoolValue = false;
  void handleAnimationSwitch({required bool value}) {
    animationBoolValue = value;
    debugPrint('Switch animation value: $animationBoolValue');
    update();
  }

  //*AlarmSettingSwitch
  bool alarmSettingBoolValue = false;
  Future<void> handleAlarmSetting({required bool value}) async {
    alarmSettingBoolValue = value;
    debugPrint('Switch alarm setting value: $alarmSettingBoolValue');

    update();
  }
}
