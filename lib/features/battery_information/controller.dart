import '../../battery_alert.dart';

class BatteryViewController extends GetxController{
  static final instance = Get.find<BatteryViewController>();

  List<BatterInforModel> batterInformationData = [
    BatterInforModel(title: 'Charging Status', subTitle: 'Not Charging', icon: AppSvgs.plugIcon),
    BatterInforModel(title: 'Temprature', subTitle: '24°c', icon: AppSvgs.temperatureIcon),
    BatterInforModel(title: 'Voltage', subTitle: '2245v', icon: AppSvgs.electricIcon),
    BatterInforModel(title: 'Technology', subTitle: 'Li-ion', icon: AppSvgs.batteryIcon2),
    BatterInforModel(title: 'Health', subTitle: 'Good', icon: AppSvgs.healthCareIcon),
    BatterInforModel(title: 'Charging type', subTitle: 'AC', icon: AppSvgs.chargerIcon2),
    BatterInforModel(title: 'Model', subTitle: 'CPH23234', icon: AppSvgs.smartPhoneIcon),
    BatterInforModel(title: 'Capacity', subTitle: '1000.0 mAh', icon: AppSvgs.trashIcon),
    BatterInforModel(title: 'Andriod Version', subTitle: '13', icon: AppSvgs.androidIcon),
    BatterInforModel(title: 'Built Id', subTitle: 'TPIA.22o9o5.001', icon: AppSvgs.idIcon),
  ];
}