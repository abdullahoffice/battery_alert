import 'package:battery_alert/features/battery_information/widgets/battery_plus.dart';

import 'battery_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(370, 690),
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

          // home: const BatteryPlus(),

          // home: const DeviceInfo(),
        );
      },
    );
  }
}
