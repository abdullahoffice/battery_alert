import '../../battery_alert.dart';

class HomeController extends GetxController {
  // String kPortNameOverlay = 'OVERLAY';
  // String kPortNameHome = 'UI';
  // final _receivePort = ReceivePort();
  // SendPort? homePort;
  // String? latestMessageFromOverlay;
  bool isOn = false;
  static final instance = Get.find<HomeController>();

  int calculateCapacityInMilliampereHours(int? capacity, int? voltage) {
    if (capacity != null &&
        voltage != null &&
        capacity != -1 &&
        voltage != -1) {
      return (voltage * capacity) ~/ 1000; // Using ~/ for integer division
    } else {
      return 0;
    }
  }

  //*AnimationSwitch

  //*Set Animation switch value
  bool animationBoolValue = false;
  Future<void> handleAnimationSetting({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    animationBoolValue = value;
    await prefs.setBool('animationBoolValue', value);
    debugPrint('Switch alarm setting value: $animationBoolValue');
    update();
  }

//*get Animation value
  Future<void> loadAnimationSetting() async {
    final prefs = await SharedPreferences.getInstance();
    var animationSettingBool = prefs.getBool('animationBoolValue') ?? false;
    animationBoolValue = animationSettingBool;
    update();
    debugPrint('Switch Animation setting value: $animationBoolValue');
  }

  //*Set Alarm switch value
  bool alarmSettingBoolValue = false;
  Future<void> handleAlarmSetting({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    alarmSettingBoolValue = value;
    await prefs.setBool('alarmSettingBoolValue', value);
    debugPrint('Switch alarm setting value: $alarmSettingBoolValue');
    debugPrint(
        'FullBatteryAlarm value: ${AlarmSettingsController.instance.fullBatteryAlarm}');
    update();
  }

  //*get ALarm value
  Future<void> loadAlarmSetting() async {
    final prefs = await SharedPreferences.getInstance();
    var alarmSettingBool = prefs.getBool('alarmSettingBoolValue') ?? false;
    alarmSettingBoolValue = alarmSettingBool;
    update();
    debugPrint('Switch alarm setting value: $alarmSettingBoolValue');
  }

  //*
  Future<void> handleService() async {
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    // bool condition = animationBoolValue || alarmSettingBoolValue;
    // debugPrint('Condition Value: $condition');
    if (animationBoolValue || alarmSettingBoolValue) {
      await initialiseService();
      if (!isRunning) {
        service.startService();
        debugPrint('Start Sevices');
      }
    } else {
      if (isRunning) {
        service.invoke("stopService");
        debugPrint('Stop Sevices');
      }
    }
  }

  //*
  Future<void> stopService() async {
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    if (isRunning) {
      service.invoke("stopService");
    }
  }

  //*
  Future<void> startService() async {
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    if (!isRunning) {
      service.startService();
    }
  }

  // Initialize method
  void initState() {
    // if (homePort != null) return;
    // final res = IsolateNameServer.registerPortWithName(
    //   _receivePort.sendPort,
    //   kPortNameHome,
    // );
    // log("$res: OVERLAY");
    // _receivePort.listen((message) {
    //   log("message from OVERLAY: $message");

    //   updateLatestMessageFromOverlay('Latest Message From Overlay: $message');
    // });
  }

  // Method to update latest message from overlay
  // void updateLatestMessageFromOverlay(String message) {
  //   latestMessageFromOverlay = message;
  //   update(); // Update the state
  // }
}
