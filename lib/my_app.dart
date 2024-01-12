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
    hasFetchedData = false;
    Get.put(CharAnimController());
    // CharAnimController.instance.showAnimation();
    // CharAnimController.instance.getSelectedImage();

    Future<void> fetchDataOnBatteryStateChange(BatteryState state) async {
      final BatteryState batteryState = await battery.batteryState;
      if (!hasFetchedData &&
          (batteryState == BatteryState.charging ||
              batteryStatus == BatteryState.full)) {
        CharAnimController.instance.getSelectedImage();
        // Get.to(() => const AnimationView());
        hasFetchedData = true;
      }
    }

    _battery.onBatteryStateChanged.listen((BatteryState state) {
      fetchDataOnBatteryStateChange(state);
      // showAnimation(state);
    });
  }

  // Future<void> showAnimation() async {
  //   BatteryInfoPlugin().androidBatteryInfoStream.listen((batteryInfo) async {
  //     if (batteryInfo != null) {
  //       final BatteryState batteryState = await battery.batteryState;
  //       if (!hasFetchedData &&
  //           (batteryState == BatteryState.charging ||
  //               batteryStatus == BatteryState.full)) {
  //         CharAnimController.instance.getSelectedImage();
  //         Get.to(() => const AnimationView());
  //         hasFetchedData = true;
  //       } else {
  //         Fluttertoast.showToast(msg: 'Device is not plugged in');
  //       }
  //     }
  //   });
  // }
  late Timer timer;
  final Battery _battery = Battery();
  bool hasFetchedData = false;
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final BatteryState batteryState =
          await battery.batteryState; // Get current battery state
      if (batteryState == BatteryState.charging ||
          batteryStatus == BatteryState.full) {
        Get.to(() => const AnimationView());
        CharAnimController.instance.getSelectedImage();
      }
    }
    debugPrint('State-InApp: $state');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    timer.cancel();
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
          home: const HomeView(),
          // home: const BaterryInfo(),
          // home: const BatteryInfoList(),
          // home: const DeviceInfo(),
          // home: const BatteryPlus(),
        );
      },
    );
  }
}
