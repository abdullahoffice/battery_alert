import '../../battery_alert.dart';

class HomeController extends GetxController {
  static final instance = Get.find<HomeController>();

  String batterylevel = "",
      batteryhealth = "",
      chargingstatus = "",
      pluggedstatus = "";

  AndroidBatteryInfo infoandroid = AndroidBatteryInfo();

  void getValues() async {
    Future.delayed(Duration.zero, () async {
      infoandroid = (await BatteryInfoPlugin().androidBatteryInfo)!;
      // infoios = await BatteryInfoPlugin().iosBatteryInfo;  for iOS
      batterylevel = infoandroid.batteryLevel.toString();
      batteryhealth = infoandroid.health.toString();
      chargingstatus = infoandroid.chargingStatus.toString();
      pluggedstatus = infoandroid.pluggedStatus.toString();
    });
    update();
  }

  void getVlues() {
    Future.delayed(Duration.zero, () async {
      BatteryInfoPlugin()
          .androidBatteryInfoStream
          .listen((AndroidBatteryInfo batteryInfo) {
            //add listiner to update values if there is changes
            infoandroid = batteryInfo;
            batterylevel = infoandroid.batteryLevel.toString();
            batteryhealth = infoandroid.health.toString();
            chargingstatus = infoandroid.chargingStatus.toString();
            pluggedstatus = infoandroid.pluggedStatus.toString();
          } as void Function(AndroidBatteryInfo? event)?);
      update();
    });
  }

  void goToSetting() {
    Get.to(const SettingView());
  }

  bool isOn = false;
  void switchButton() {}
}
