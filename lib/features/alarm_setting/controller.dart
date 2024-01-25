import '../../battery_alert.dart';

class AlarmSettingsController extends GetxController {
  static final instance = Get.find<AlarmSettingsController>();

  bool isSwitched = false;

  //*
  double currentSliderValue = 30;
  swithFunc(value) {
    currentSliderValue = value;
  }

  //*AlarmSettingSwitch
  bool fullBatteryAlarm = false;
  handleFullBatteryAlarm({required bool value}) {
    fullBatteryAlarm = value;
    update();
    debugPrint('Switch alarm setting value: $fullBatteryAlarm');
  }

  //*AlarmSettingSwitch
  bool lowBatteryAlarm = false;
  handleLowBatteryAlarm({required bool value}) {
    lowBatteryAlarm = value;
    update();
    debugPrint('Switch alarm setting value: $lowBatteryAlarm');
  }
}












/**void main() {
  String dest = 'Pak';
  double weight = 20;
  
  if(dest == 'XYZ'){
    print('${weight * 10}');
  }else if(dest == 'YYY'){
    print('${weight * 5}');
  }else if(dest == 'Pak'){
    print('${weight * 2}');
  }else {
    print('Error');
  }
  
  switch(dest){
    case 'XVR' :
        print('${weight * 10}');
    case 'Pak':
        print('${weight * 1}');
      case '222':
        print('${weight * 1}');
      default :
      print('ERROR');
  }
}
 */