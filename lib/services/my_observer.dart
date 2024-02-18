// import '../battery_alert.dart';

// class MyObserver extends WidgetsBindingObserver {
//   final charAnimController = Get.put(CharAnimController());
//   final homeController = Get.put(HomeController());
//   final _hasShownAnimationOnce = ValueNotifier<bool>(false);

//   @override
//   Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
//     if (state == AppLifecycleState.resumed) {
//       // BatteryUsageController.instance.getWeeklyUsageStats();
//       // BatteryUsageController.instance.getDailyUsageStats();
//       //* Check battery state and    actions if charging or full.
//       battery.onBatteryStateChanged.listen((BatteryState state) async {
//         final isChargingOrFull =
//             state == BatteryState.charging || state == BatteryState.full;
//         if (isChargingOrFull) {
//           if (!_hasShownAnimationOnce.value &&
//               homeController.animationBoolValue) {
//             debugPrint('Battery State: $state');
//             debugPrint('Show Animation: $_hasShownAnimationOnce');
//             Get.toNamed(RouteName.chargingAnimationScreen);

//             // Navigator.push(
//             //   Get.context!,
//             //   CustomPageRoute(widget: const AnimationView()),
//             // );

//             charAnimController.getSelectedImage();
//             _hasShownAnimationOnce.value = true;
//           }
//         } else {
//           _hasShownAnimationOnce.value = false;
//         }
//       });
//     } else if (state == AppLifecycleState.detached) {
//       //* Check battery state and perform actions if charging or full.
//       debugPrint('App state: $state');
//       battery.onBatteryStateChanged.listen((BatteryState state) async {
//         final isChargingOrFull =
//             state == BatteryState.charging || state == BatteryState.full;
//         if (isChargingOrFull) {
//           if (!_hasShownAnimationOnce.value &&
//               homeController.animationBoolValue) {
//             debugPrint('Pause Charge Animations 1');
//             // FlutterForegroundTask.launchApp('/charging_animation');
//             charAnimController.getSelectedImage();
//             // _hasShownAnimationOnce.value = true;
//             FlutterForegroundTask.launchApp(RouteName.chargingAnimationScreen);
//             _hasShownAnimationOnce.value = true;
//           }
//         } else {
//           _hasShownAnimationOnce.value = false;
//         }
//       });
//     }
//     // else if (state == AppLifecycleState.paused) {
//     //   //* Check battery state and perform actions if charging or full.
//     //   debugPrint('App state: $state');
//     //   battery.onBatteryStateChanged.listen((BatteryState state) async {
//     //     final isChargingOrFull =
//     //         state == BatteryState.charging || state == BatteryState.full;
//     //     if (isChargingOrFull) {
//     //       if (!_hasShownAnimationOnce.value &&
//     //           homeController.animationBoolValue) {
//     //         debugPrint('Pause Charge Animations 2');
//     //         debugPrint('Show Animation: $_hasShownAnimationOnce');
//     //         Get.toNamed(RouteName.chargingAnimationScreen);
//     //         charAnimController.getSelectedImage();
//     //         _hasShownAnimationOnce.value = true;
//     //         FlutterForegroundTask.launchApp(RouteName.chargingAnimationScreen);
//     //         _hasShownAnimationOnce.value = true;
//     //       }
//     //     } else {
//     //       _hasShownAnimationOnce.value = false;
//     //     }
//     //   });
//     // } else if (state == AppLifecycleState.hidden) {
//     //   //* Check battery state and perform actions if charging or full.
//     //   debugPrint('App state: $state');
//     //   battery.onBatteryStateChanged.listen((BatteryState state) async {
//     //     final isChargingOrFull =
//     //         state == BatteryState.charging || state == BatteryState.full;
//     //     if (isChargingOrFull) {
//     //       if (!_hasShownAnimationOnce.value &&
//     //           homeController.animationBoolValue) {
//     //         debugPrint('Pause Charge Animations 3');
//     //         debugPrint('Show Animation: $_hasShownAnimationOnce');
//     //         Get.toNamed(RouteName.chargingAnimationScreen);
//     //         charAnimController.getSelectedImage();
//     //         _hasShownAnimationOnce.value = true;
//     //         FlutterForegroundTask.launchApp(RouteName.chargingAnimationScreen);
//     //         _hasShownAnimationOnce.value = true;
//     //       }
//     //     } else {
//     //       _hasShownAnimationOnce.value = false;
//     //     }
//     //   });
//     // } else if (state == AppLifecycleState.inactive) {
//     //   //* Check battery state and perform actions if charging or full.
//     //   debugPrint('App state: $state');
//     //   battery.onBatteryStateChanged.listen((BatteryState state) async {
//     //     final isChargingOrFull =
//     //         state == BatteryState.charging || state == BatteryState.full;
//     //     if (isChargingOrFull) {
//     //       if (!_hasShownAnimationOnce.value &&
//     //           homeController.animationBoolValue) {
//     //         debugPrint('Pause Charge Animations 4');
//     //         debugPrint('Show Animation: $_hasShownAnimationOnce');
//     //         Get.toNamed(RouteName.chargingAnimationScreen);
//     //         charAnimController.getSelectedImage();
//     //         _hasShownAnimationOnce.value = true;
//     //         FlutterForegroundTask.launchApp(RouteName.chargingAnimationScreen);
//     //         _hasShownAnimationOnce.value = true;
//     //       }
//     //     } else {
//     //       _hasShownAnimationOnce.value = false;
//     //     }
//     //   });
//     // }
//   }
// }
