import '../battery_alert.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(HomeController());
    Get.put(SettingController());
    Get.put(BatteryViewController());
    Get.put(ChargingHistoryController());
    Get.put(AlarmSettingsController());
    Get.put(BatteryUsageController());
    Get.put(ChargerTestingController());
    Get.put(ChargingAnimController());
    Get.put(PremiumController());
  }
}
