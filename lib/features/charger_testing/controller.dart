import '../../battery_alert.dart';

class ChargerTestingController extends GetxController {
  static final instance = Get.find<ChargerTestingController>();
  // cal Min Current
  double calculateMinCurrent(double? currentNow, double? currentAverage) {
    if (currentNow == null || currentAverage == null) {
      return 0.0;
    }
    double minCurrent = currentNow - currentAverage;
    return minCurrent / 1000;
  }

  // Timer
  final s = Stream.periodic(const Duration(seconds: 1)).asBroadcastStream();
  StreamSubscription? subscription;
  bool isTimerRunning = false;
  bool isPressed = false;
  Duration duration = const Duration();
  final Battery _battery = Battery();
  String chargerStatus = "Unknown";
  int? plugInBattery;
  int? plugOutBattery;

  void addTime() {
    const addSeconds = 1;
    duration += const Duration(seconds: addSeconds);
  }

  Future<void> startTimer() async {
    final BatteryState batteryState = await _battery.batteryState;

    if (batteryState == BatteryState.charging) {
      if (!isTimerRunning) {
        // debugPrint('is: $isPressed');
        if (subscription == null || subscription!.isPaused) {
          subscription = s.listen((_) {
            addTime();
            update();
          });
        }
        isTimerRunning = true;
        // Get the battery level when the timer starts
        int batteryLevel = await _battery.batteryLevel;
        plugInBattery = batteryLevel;

        debugPrint('SBatt: $plugInBattery');
      }
    } else {
      Get.dialog(const ConnectCharPopup());
    }
  }

  Future<void> stopTimer() async {
    isTimerRunning = false;
    subscription?.cancel();
    subscription = null;
    duration = const Duration();
    // charge
    int batteryLevel = await _battery.batteryLevel;
    plugOutBattery = batteryLevel;
    debugPrint('EBatt: $plugOutBattery');

    int batteryLevelDifference = plugOutBattery! - plugInBattery!;

    debugPrint('diff: $batteryLevelDifference');

    debugPrint('Charger status: $chargerStatus');
  }

  //
  String calculateChargerStatus() {
    int batteryLevelDifference = plugOutBattery! - plugInBattery!;

    debugPrint('Battery Level Difference: $batteryLevelDifference');

    if (batteryLevelDifference < 0 && storedMinutes > 1) {
      chargerStatus = "Very Poor";
    } else if (batteryLevelDifference == 0 && storedMinutes > 1) {
      chargerStatus = "Poor";
    } else if (batteryLevelDifference == 1 && storedMinutes <= 1) {
      chargerStatus = "Good";
    } else if (batteryLevelDifference > 1 && storedMinutes <= 1) {
      chargerStatus = "Excellent";
    } else {
      chargerStatus = "Poor";
    }
    return chargerStatus;
    // debugPrint('Charger status: $chargerStatus');
  }

  void onTap() {
    if (isTimerRunning) {
      stopTimer();
      update();
    } else {
      startTimer();
      update();
    }
  }

  // Formatted Time for UI
  String twoDigits(int n, {int minLength = 2}) {
    return n.toString().padLeft(minLength, '0');
  }

  int storedMinutes = 0;
  String get formattedTime {
    final minutesPart = twoDigits(duration.inMinutes.remainder(60));
    final secondsPart = twoDigits(duration.inSeconds.remainder(60));
    final millisecondsPart =
        twoDigits(duration.inMilliseconds.remainder(1000), minLength: 3)
            .substring(1);
    storedMinutes = duration.inMinutes.remainder(60);
    return '$minutesPart:$secondsPart:$millisecondsPart';
  }
}








// Charging state
  // void updateChargerStatus() {
  //   int minutesRemaining = duration.inMinutes.remainder(60);
  //   int secondsRemaining = duration.inSeconds.remainder(60);

  //   if ((minutesRemaining == 0 && secondsRemaining > 1) ||
  //       (minutesRemaining > 1)) {
  //     chargerStatus = "Very Poor";
  //   } else if (minutesRemaining == 0 && secondsRemaining == 0) {
  //     chargerStatus = "Poor";
  //   } else if (minutesRemaining == 1 && secondsRemaining <= 1) {
  //     chargerStatus = "Good";
  //   } else if (minutesRemaining > 1 && secondsRemaining < 1) {
  //     chargerStatus = "Excellent";
  //   } else {
  //     chargerStatus = "Poor";
  //   }
  // }