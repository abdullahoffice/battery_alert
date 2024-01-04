// import '../../../battery_alert.dart';

// class ChargingHistoryController extends GetxController {
//   var battery = Battery();
//   static final instance = Get.find<ChargingHistoryController>();

//   Timer? _timer;
//   bool isCharging = false;

//   void addTime() {
//     const addSeconds = 1;
//     final seconds = duration.inSeconds + addSeconds;
//     duration = Duration(seconds: seconds);
//   }

//   void startChargingTimer() {
//     if (_timer == null || !_timer!.isActive) {
//       _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//         addTime();
//         // String plugInTime = _timer.toString();
//         // debugPrint('charging: $plugInTime');

//         update(); // Uncomment if needed
//       });
//     }
//   }

//   String get pluggedInTime =>
//       [hours, minutes, seconds].where((part) => part != '00').join(':');

//   //*FormattedTimeForUI
//   Duration duration = const Duration();
//   String twoDigits(int n) => n.toString().padLeft(2, '0');
//   String get hours => twoDigits(duration.inHours);
//   String get minutes => twoDigits(duration.inMinutes.remainder(60));
//   String get seconds => twoDigits(duration.inSeconds.remainder(60));
//   String get formattedTime =>
//       [hours, minutes, seconds].where((part) => part != '00').join(':');

//   String get formattedDateTime {
//     return DateFormat('HH:mm:ss').format(DateTime.now());
//   }

//   //*init
//   @override
//   void onInit() {
//     super.onInit();

//     Battery().onBatteryStateChanged.listen((BatteryState state) {
//       if (state == BatteryState.charging) {
//         startChargingTimer();
//       } else {
//         stopChargingTimer();
//       }
//       isCharging = state == BatteryState.charging;
//     });
//   }

//   void stopChargingTimer() {
//     _timer?.cancel();
//   }

//   //*DiffPerc

//   //*BatteryInfoHandler
//   // String plugInTime = '';
//   String plugInTime = '';
//   String plugOutTime = '';
//   String plugInDate = '';
//   String plugOutDate = '';
//   String pluginPercentage = '';
//   String plugoutPercentage = '';

//   void func() {
//     BatteryInfoPlugin().androidBatteryInfoStream.listen((batteryInfo) {
//       if (batteryInfo != null) {
//         batteryInfo.chargingStatus;
//         switch (batteryInfo.chargingStatus) {
//           case ChargingStatus.Charging:
//             plugInTime = DateFormat('HH:mm:ss').format(DateTime.now());
//             plugInDate = DateFormat('MMM d').format(DateTime.now());
//             pluginPercentage = batteryInfo.batteryLevel.toString();

//             debugPrint("Plug in time: $plugInTime");
//             break;
//           case ChargingStatus.Discharging:
//             plugOutTime = DateFormat('HH:mm:ss').format(DateTime.now());
//             plugOutDate = DateFormat('MMM d').format(DateTime.now());
//             plugoutPercentage = batteryInfo.batteryLevel.toString();
//             debugPrint('plugged out: $plugOutTime');
//             break;
//           case ChargingStatus.Full:
//             break;
//           case ChargingStatus.Unknown:
//             break;
//           case null:
//             break;
//         }
//       }
//     });
//   }

//   void handleCharging(AndroidBatteryInfo batteryInfo) {
//     plugInTime = DateFormat('HH:mm:ss').format(DateTime.now());
//     plugInDate = DateFormat('MMM d').format(DateTime.now());
//     pluginPercentage = batteryInfo.batteryLevel.toString();

//     debugPrint("Plug in time: $plugInTime");
//   }

//   void handleDischarging(AndroidBatteryInfo batteryInfo) {
//     plugOutTime = DateFormat('HH:mm:ss').format(DateTime.now());
//     plugOutDate = DateFormat('MMM d').format(DateTime.now());
//     plugoutPercentage = batteryInfo.batteryLevel.toString();
//     debugPrint('Plugged out: $plugOutTime');

//     // Calculate and print the percentage difference
//     double difference = calculatePercentageDifference(
//         double.parse(pluginPercentage), double.parse(plugoutPercentage));
//     debugPrint('Percentage Difference: $difference%');
//   }

//   double calculatePercentageDifference(
//       double pluginPercentage, double plugoutPercentage) {
//     pluginPercentage = pluginPercentage.clamp(0.0, 100.0);
//     plugoutPercentage = plugoutPercentage.clamp(0.0, 100.0);

//     double difference = (plugoutPercentage - pluginPercentage).abs();

//     return difference;
//   }

//   double getPercentageDifference() {
//     try {
//       if (pluginPercentage.isNotEmpty && plugoutPercentage.isNotEmpty) {
//         double pluginValue = double.parse(pluginPercentage);
//         double plugoutValue = double.parse(plugoutPercentage);

//         pluginValue = pluginValue.clamp(0.0, 100.0);
//         plugoutValue = plugoutValue.clamp(0.0, 100.0);

//         return (plugoutValue - pluginValue).abs();
//       } else {
//         debugPrint('One or both percentages are empty');
//         return 0.0;
//       }
//     } catch (e) {
//       debugPrint('Error parsing percentage difference: $e');
//       return 0.0;
//     }
//   }
// }
