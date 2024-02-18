import 'package:flutter/services.dart';
import 'battery_alert.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final controller = Get.put(HomeController());
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  startCallTimer() async {
    await Future.delayed(const Duration(seconds: 0), () async {
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]);
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

      await Get.to(() => const AnimationView());
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      Battery battery = Battery();
      battery.onBatteryStateChanged.listen((batteryListen) async {
        if (batteryListen == BatteryState.charging) {
          if (controller.animationBoolValue) {
            startCallTimer();
          } else {
            // Fluttertoast.showToast(msg: 'Background services not started');
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(960, 1440),
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return  GetMaterialApp(
            // navigatorObservers: [MyObserver()],
            initialBinding: AppBinding(),
            title: 'Battery Alert App',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: BAppThemes.lightTheme,
            getPages: AppRoutes.appRoutes(),
            // initialRoute: '/',
            // routes: {
            //     '/': (context) => const SplashView(),
            //     '/home_view': (context) => const HomeView(),
            //     '/settings': (context) => const SettingView(),
            //     '/premium': (context) => const PremiumView(),
            //     '/charging_history': (context) => const ChargingHistoryView(),
            //     '/charging_animation': (context) => const AnimationView(),
            //     '/selected_animation': (context) => const SelectAnimation(),
            //     '/charger_testing': (context) => const ChargerTestingView(),
            //     '/battery_usage': (context) => const BatteryUsageView(),
            //     '/battery_information': (context) => const BatteryInfoView(),
            //   //   '/alarm_setting': (context) => const AlarmSettingsView(),
            // },
          );
      },
    );
  }
}
