import 'battery_alert.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Get.put(CharAnimController());
  }
 
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      Get.put(BatteryViewController);
      BatteryViewController.instance
          .updateBatteryInformation(AndroidBatteryInfo());
      BatteryInfoPlugin().androidBatteryInfoStream;
      BatteryUsageController.instance.getDailyUsageStats();
      BatteryUsageController.instance.getWeeklyUsageStats();
      final BatteryState batteryState =
          await battery.batteryState; // Get current battery state

      if (batteryState == BatteryState.charging ||
          batteryStatus == BatteryState.full) {
        // final historyStorage = await BatteryAlertStorage.getInstance();
        // historyStorage.getChargingHistory();
        ChargingHistoryController.instance.getCharhistory();
        await BatteryAlertStorage.getInstance();
        debugPrint('BoolValueF: ${HomeController.instance.animationBoolValue}');
        if (HomeController.instance.animationBoolValue) {
          debugPrint(
              'BoolValueT: ${HomeController.instance.animationBoolValue}');
          // Get.to(() => const AnimationView());

          Get.to(() => const AnimationView());
          CharAnimController.instance.getSelectedImage();
        }
      }
    }

    debugPrint('State-InApp: $state');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(370, 900),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: AppBinding(),
          title: 'Battery Alert App',

          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: BAppThemes.lightTheme,
          // home: const BackgroudServices(),
          home: const SplashView(),
          // home: const BaterryInfo(),
          // home: const BatteryInfoList(),
          // home: const DeviceInfo(),
          // home: const BatteryPlus(),
        );
      },
    );
  }
}
