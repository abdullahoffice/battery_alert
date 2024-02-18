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
    Get.put(CharAnimController());
    Get.put(PremiumController());
    Get.put(GlobalController());
  }
}

// class AppBinding extends Binding {
//   @override
//   List<Bind> dependencies() {
//     return binds;
//   }

//   static List<Bind> binds = [
//     ///Networking

//     ///Controllers
//     Bind.put(SplashController()),
//     Bind.put(HomeController()),
//     Bind.put(SettingController()),
//     Bind.put(BatteryViewController()),
//     Bind.put(ChargingHistoryController()),
//     Bind.put(AlarmSettingsController()),
//     Bind.put(BatteryUsageController()),
//     Bind.put(ChargerTestingController()),
//     Bind.put(CharAnimController()),
//     Bind.put(PremiumController()),
//     Bind.put(GlobalController()),
//   ];
// }
