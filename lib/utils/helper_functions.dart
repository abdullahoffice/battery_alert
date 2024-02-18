import '../battery_alert.dart';

class KHelperFunctions {
  // --Screen Size
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  // --Screen Height
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  // --Screen Width
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  // --formatted time

  String formatTime(int minutes) {
    final duration = Duration(minutes: minutes);
    final formatter = DateFormat('HH:mm');
    return formatter
        .format(DateTime(2000, 1, 1, duration.inHours, duration.inMinutes));
  }
  String formatToime(int minutes) {
  final duration = Duration(minutes: minutes);
  final hours = duration.inHours.toString().padLeft(2, '0');
  final minutesStr = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  return '${hours}h:${minutesStr}m';
}

}
