import '../../battery_alert.dart';

class GlobalController extends GetxController {
  static final instance = Get.find<GlobalController>();

  final batteryInfoPlugin = BatteryInfoPlugin();
}
