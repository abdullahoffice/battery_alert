import 'package:battery_alert/features/alarm_setting/view/alarmsetting_screen.dart';

import '../battery_alert.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: RouteName.splashScreen,
        page: () => const SplashView(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: RouteName.homeScreen,
        page: () => const HomeView(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: RouteName.settingsScreen,
        page: () => const SettingView(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: RouteName.premiumScreen,
        page: () => const PremiumView(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: RouteName.chargingHistoryScreen,
        page: () => const ChargingHistoryView(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: RouteName.chargingAnimationScreen,
        page: () => const AnimationView(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: RouteName.selectAnimationScreen,
        page: () => const SelectAnimation(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: RouteName.chargerTestingScreen,
        page: () => const ChargerTestingView(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: RouteName.batteryUsageScreen,
        page: () => const BatteryUsageView(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: RouteName.batteryInformationScreen,
        page: () => const BatteryInfoView(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: RouteName.alarmSettingScreen,
        page: () => const AlarmSettingsScreen(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 250),
      ),
    ];
  }
}
