import '../../battery_alert.dart';

class BatteryViewController extends GetxController {
  late final StreamSubscription<AndroidBatteryInfo?> _batteryInfoSubscription;
  RxDouble batteryLevel = 0.0.obs;
  // String? healthStatus = AndroidBatteryInfo().health?.split('_').last;
  // String? deviceModel;
  // String? androidVersion;
  // String? buildId;
  AndroidBatteryInfo batteryInfo = AndroidBatteryInfo();
  static final instance = Get.find<BatteryViewController>();

  @override
  void onInit() {
    super.onInit();
    debugPrint('Battery${batteryLevel.value}');
    // Initialize the stream subscription
    _batteryInfoSubscription =
        BatteryInfoPlugin().androidBatteryInfoStream.listen((data) {
      debugPrint('Batteryy${batteryLevel.value}');
      batteryLevel.value = (data!.batteryLevel! / 100);
      update();
    });
  }

  //*Get Device information

  @override
  void onClose() {
    // Cancel the stream subscription when the controller is disposed
    _batteryInfoSubscription.cancel();
    fetchDeviceInformation();
    super.onClose();
  }

  //

  //...

  String? deviceModel;
  String? androidVersion;
  String? buildId;
  void fetchDeviceInformation() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (GetPlatform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

        deviceModel = androidInfo.model;
        androidVersion = androidInfo.version.release;
        buildId = androidInfo.id;
      } else if (GetPlatform.isIOS) {
        // For iOS if needed
      }
    } catch (e) {
      print('Error fetching device information: $e');
      buildId = 'Unknown';
      deviceModel = 'Unknown';
      androidVersion = 'Unknown';
    }
    update(); // Notify listeners of changes
  }
  // //*
  // List<BatteryInforModel> batterInformationData = [
  //   BatteryInforModel(
  //     title: 'Charging Status',
  //     subTitle: 'Unknown', // Initial value can be 'Unknown' or 'Not Available'
  //     icon: AppSvgs.plugIcon,
  //   ),
  //   BatteryInforModel(
  //     title: 'Temperature',
  //     subTitle: '0°C', // Initial value can be '0°C' or 'Unknown'
  //     icon: AppSvgs.temperatureIcon,
  //   ),
  //   BatteryInforModel(
  //     title: 'Voltage',
  //     subTitle: '0v', // Initial value can be '0v' or 'Unknown'
  //     icon: AppSvgs.electricIcon,
  //   ),
  //   BatteryInforModel(
  //     title: 'Voltage',
  //     subTitle: '0v', // Initial value can be '0v' or 'Unknown'
  //     icon: AppSvgs.electricIcon,
  //   ),
  //   BatteryInforModel(
  //     title: 'Voltage',
  //     subTitle: '0v', // Initial value can be '0v' or 'Unknown'
  //     icon: AppSvgs.electricIcon,
  //   ),
  //   BatteryInforModel(
  //     title: 'Charging Type',
  //     subTitle: 'Unknown', // Initial value can be 'Unknown' or 'Not Available'
  //     icon: AppSvgs.chargerIcon2,
  //   ),
  //   BatteryInforModel(
  //     title: 'Model',
  //     subTitle: 'Unknown',
  //     icon: AppSvgs.smartPhoneIcon,
  //   ),
  //   BatteryInforModel(
  //     title: 'Capacity',
  //     subTitle: '0.0 mAh', // Initial value can be '0.0 mAh' or 'Unknown'
  //     icon: AppSvgs.trashIcon,
  //   ),
  //   BatteryInforModel(
  //     title: 'Android Version',
  //     subTitle: 'Unknown',
  //     icon: AppSvgs.androidIcon,
  //   ),
  //   BatteryInforModel(
  //     title: 'Build ID',
  //     subTitle: 'Unknown',
  //     icon: AppSvgs.alarmIcon,
  //   ),
  // ];

  //*
  // Future<void> updateBatteryInformation(AndroidBatteryInfo batteryInfo) async {
  //   if (batteryInfo.health != null) {
  //     String healthStatus = batteryInfo.health!.split('_').last;
  //     debugPrint('Health: $healthStatus');
  //     AndroidDeviceInfoModel? deviceInfo = await getAndroidDeviceInfo();
  //     debugPrint('');
  //     // batterInformationData[0].subTitle =
  //     AppScreenUtils.getChargingStatus(batteryInfo.chargingStatus);

  // batterInformationData[1].subTitle = '${batteryInfo.temperature ?? 0}°C';

  // batterInformationData[2].subTitle = '${batteryInfo.voltage! / 1000}v';
  // batterInformationData[3]
  //     .updateSubTitle(batteryInfo.technology ?? 'Unknown');
  // batterInformationData[4].updateSubTitle(healthStatus);
  // batterInformationData[5].updateSubTitle(
  //     batteryInfo.pluggedStatus == "plugged" ? "AC" : "DC"); //Charging type
  // batterInformationData[6].updateSubTitle(deviceInfo!.model ?? 'Unknown');
  // batterInformationData[7]
  //     .updateSubTitle('${batteryInfo.batteryCapacity! / 100} mAh');
  // batterInformationData[8]
  //     .updateSubTitle(deviceInfo.androidVersion ?? 'Unknown');
  // batterInformationData[9].updateSubTitle(deviceInfo.buildId ?? 'Unknown');
  // }
  // }
}
