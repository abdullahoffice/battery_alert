import '../../battery_alert.dart';

class HomeController extends GetxController {
  static final instance = Get.find<HomeController>();

//   String formatRemainingTime(int chargeTimeRemaining) {
//   if (chargeTimeRemaining == null) {
//     return '--'; // Handle unavailable data
//   }

//   final Duration remainingTime = Duration(seconds: chargeTimeRemaining);
//   final int hours = remainingTime.inHours;
//   final int minutes = remainingTime.inMinutes % 60;

//   return hours > 0
//       ? '$hours h $minutes m'
//       : '$minutes m';
// }

  // void goToSetting() {
  //   Get.to(const SettingView());
  // }

  // bool isOn = false;
  // void switchButton() {}
}
