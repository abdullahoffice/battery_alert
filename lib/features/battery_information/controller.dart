import '../../battery_alert.dart';

class BatteryViewController extends GetxController {
  static final instance = Get.find<BatteryViewController>();

  List<BatteryInforModel> batterInformationData = [
    BatteryInforModel(
        title: 'Charging Status',
        subTitle: 'Not Charging',
        icon: AppSvgs.plugIcon),
    BatteryInforModel(
        title: 'Temprature', subTitle: '°c', icon: AppSvgs.temperatureIcon),
    BatteryInforModel(
        title: 'Voltage', subTitle: 'v', icon: AppSvgs.electricIcon),
    BatteryInforModel(
        title: 'Technology', subTitle: 'L', icon: AppSvgs.batteryIcon2),
    BatteryInforModel(
        title: 'Health', subTitle: 'G', icon: AppSvgs.healthCareIcon),
    BatteryInforModel(
        title: 'Charging type', subTitle: '', icon: AppSvgs.chargerIcon2),
    BatteryInforModel(
        title: 'Model', subTitle: 'C', icon: AppSvgs.smartPhoneIcon),
    BatteryInforModel(
        title: 'Capacity', subTitle: '1.0 mAh', icon: AppSvgs.trashIcon),
    BatteryInforModel(
        title: 'Andriod Version', subTitle: '1', icon: AppSvgs.androidIcon),
    BatteryInforModel(
        title: 'Built Id', subTitle: 'T9o5.001', icon: AppSvgs.idIcon),
  ];

  void updateBatteryInformation(AndroidBatteryInfo batteryInfo) {
    batterInformationData[0]
        .updateSubTitle(batteryInfo.pluggedStatus ?? 'Unknown');
    batterInformationData[1].subTitle = '${batteryInfo.temperature ?? 0}°C';
    batterInformationData[2].subTitle = '${batteryInfo.voltage ?? 0}v';
    batterInformationData[3]
        .updateSubTitle(batteryInfo.technology ?? 'Unknown');
    batterInformationData[4].updateSubTitle(batteryInfo.health ?? 'Unknown'); //
    batterInformationData[5]
        .updateSubTitle(batteryInfo.health ?? 'Unknown'); //Charging type
    batterInformationData[6]
        .updateSubTitle(batteryInfo.health ?? 'Unknown'); //Model
    batterInformationData[7]
        .updateSubTitle('${batteryInfo.batteryCapacity ?? 0.0} mAh');
    batterInformationData[8]
        .updateSubTitle(batteryInfo.health ?? 'Unknown'); //Andriod Version
    batterInformationData[9]
        .updateSubTitle(batteryInfo.health ?? 'Unknown'); //Built Id
  }
}
