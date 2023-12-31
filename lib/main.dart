import 'battery_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          // home: const BaterryInfo(),
          home: const HomeView(),
          // home: const BatteryInfoList(),
          // home: const BatteryPlus(),
          // home: const DeviceInfo(),
        );
      },
    );
  }
}
