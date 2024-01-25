import '../../battery_alert.dart';

class BatteryViewController extends GetxController {
  static final instance = Get.find<BatteryViewController>();
  //*
  List<BatteryInforModel> batterInformationData = [
    BatteryInforModel(
      title: 'Charging Status',
      subTitle: 'Unknown', // Initial value can be 'Unknown' or 'Not Available'
      icon: AppSvgs.plugIcon,
    ),
    BatteryInforModel(
      title: 'Temperature',
      subTitle: '0°C', // Initial value can be '0°C' or 'Unknown'
      icon: AppSvgs.temperatureIcon,
    ),
    BatteryInforModel(
      title: 'Voltage',
      subTitle: '0v', // Initial value can be '0v' or 'Unknown'
      icon: AppSvgs.electricIcon,
    ),
    BatteryInforModel(
      title: 'Technology',
      subTitle: 'Unknown',
      icon: AppSvgs.batteryIcon2,
    ),
    BatteryInforModel(
      title: 'Health',
      subTitle: 'Unknown',
      icon: AppSvgs.healthCareIcon,
    ),
    BatteryInforModel(
      title: 'Charging Type',
      subTitle: 'Unknown', // Initial value can be 'Unknown' or 'Not Available'
      icon: AppSvgs.chargerIcon2,
    ),
    BatteryInforModel(
      title: 'Model',
      subTitle: 'Unknown',
      icon: AppSvgs.smartPhoneIcon,
    ),
    BatteryInforModel(
      title: 'Capacity',
      subTitle: '0.0 mAh', // Initial value can be '0.0 mAh' or 'Unknown'
      icon: AppSvgs.trashIcon,
    ),
    BatteryInforModel(
      title: 'Android Version',
      subTitle: 'Unknown',
      icon: AppSvgs.androidIcon,
    ),
    BatteryInforModel(
      title: 'Build ID',
      subTitle: 'Unknown',
      icon: AppSvgs.idIcon,
    ),
  ];

  //*
  Future<void> updateBatteryInformation(AndroidBatteryInfo batteryInfo) async {
    if (batteryInfo.health != null) {
      String healthStatus = batteryInfo.health!.split('_').last;

      AndroidDeviceInfoModel? deviceInfo = await getAndroidDeviceInfo();
      debugPrint('');
      batterInformationData[0].subTitle =
          AppScreenUtils.getChargingStatus(batteryInfo.chargingStatus);

      batterInformationData[1].subTitle = '${batteryInfo.temperature ?? 0}°C';
      batterInformationData[2].subTitle = '${batteryInfo.voltage! / 1000}v';
      batterInformationData[3]
          .updateSubTitle(batteryInfo.technology ?? 'Unknown');
      batterInformationData[4].updateSubTitle(healthStatus);
      batterInformationData[5].updateSubTitle(
          batteryInfo.pluggedStatus == "plugged" ? "AC" : "DC"); //Charging type
      batterInformationData[6].updateSubTitle(deviceInfo!.model ?? 'Unknown');
      batterInformationData[7]
          .updateSubTitle('${batteryInfo.batteryCapacity! / 100} mAh');
      batterInformationData[8]
          .updateSubTitle(deviceInfo.androidVersion ?? 'Unknown');
      batterInformationData[9].updateSubTitle(deviceInfo.buildId ?? 'Unknown');
    }
  }
}
