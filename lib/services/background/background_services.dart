import '../../battery_alert.dart';

//*AppInitializer
Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  // Get.put(BatteryViewController);
  //  BatteryViewController.instance
  //     .updateBatteryInformation(AndroidBatteryInfo());
  await service.configure(
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
    ),
  );
}

// lib/services/ios_background.dart
@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

// lib/services/android_background.dart
@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // bring to foreground
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        Get.put(AlarmSettingsController());
        if (AlarmSettingsController.instance.fullBatteryAlarm) {
          service.setForegroundNotificationInfo(
            title: "Battery Alert",
            content: "Full Battery Alarm turns on",
          );
        }
      }
    }
  });
  Battery battery = Battery();
  // AlarmSettingsController controller = AlarmSettingsController();
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    //* lib/services/notification_service.dart
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'my_foreground',
            'MY FOREGROUND SERVICE',
            icon: 'ic_bg_service_small',
            ongoing: true,
          ),
        );
        //*Notification
        int batteryLevel = await battery.batteryLevel;

        if (batteryLevel == 100) {
          service.setForegroundNotificationInfo(
            title: "Battery Full! $batteryLevel%",
            content: 'Unplug the charger to save electricity.',
          );
        } else if (batteryLevel == 20) {
          service.setForegroundNotificationInfo(
            title: "Low Battery! $batteryLevel%",
            content: "Connect to charger soon to avoid interruptions.",
          );
        } else {
          service.setForegroundNotificationInfo(
            title: "Battery Alert running",
            content: "Tap to open",
          );
        }
        // if (AlarmSettingsController.instance.fullBatteryAlarm && await service.isForegroundService()) {
        //   service.setForegroundNotificationInfo(
        //     title: " Battery! $batteryLevel%",
        //     content: "Connect to charger soon to avoid interruptions.",
        //   );
        //   Future.delayed(const Duration(seconds: 5), () async {
        //     await service.stopSelf();
        //   });
        // }
      }
    }

    //*Perform Background operations which is not noticeable to user
    //lib/services/background_operations.dart
    // debugPrint('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');
    service.invoke('updated');
  });
}
