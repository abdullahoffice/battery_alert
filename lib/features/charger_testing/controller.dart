import '../../battery_alert.dart';

class ChargerTestingController extends GetxController {
  Rx<AndroidBatteryInfo?> batterySnapshot = Rx<AndroidBatteryInfo?>(null);
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
    // duration += const Duration(milliseconds: addSeconds);
    // update();
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
  String? calculateChargerStatus() {
    if (plugOutBattery == null || plugInBattery == null) {
      return null; // or provide a default value if appropriate
    }
    int batteryLevelDifference = plugOutBattery! - plugInBattery!;

    debugPrint('Battery Level Difference: $batteryLevelDifference');

    if (batteryLevelDifference > 1 && storedMinutes > 3) {
      chargerStatus = "Poor";
    } else if ((batteryLevelDifference == 1 && storedMinutes <= 3)) {
      chargerStatus = "Good";
    } else if (batteryLevelDifference == 1 && storedMinutes <= 2) {
      chargerStatus = "Good";
    } else if (batteryLevelDifference == 1 && storedMinutes <= 1) {
      chargerStatus = "Excellent";
    } else {
      chargerStatus = "Not Charged Yet";
    }
    debugPrint('Charger status: $chargerStatus');
    return chargerStatus;
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
    final millisecondsPart = twoDigits(
      duration.inMilliseconds.remainder(1000),
    );
    storedMinutes = duration.inMinutes.remainder(60);
    // return '$minutesPart:$secondsPart:$millisecondsPart';
    return '$minutesPart:$secondsPart';
  }

  // Timer? timerRemain;
  // int miliSeconds = 0;
  // int minutesRe = 0;
  // int secondsRe = 0;
  // bool isRunning = false;
  // bool mounted = false;
  // void startTimerRe() {
  //   miliSeconds = 0;
  //   minutesRe = 0;
  //   secondsRe = 0;
  //   // chargerSat = '';

  //   timerRemain = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
  //     isRunning = true;
  //     if (!mounted || minutesRe == 3) {
  //       t.cancel();
  //       update();
  //     }

  //     miliSeconds += 100;
  //     if (miliSeconds == 1000) {
  //       miliSeconds = 0;
  //       secondsRe++;
  //       if (secondsRe == 60) {
  //         secondsRe = 0;
  //         minutesRe++;
  //         if (minutesRe == 60) {
  //           minutesRe = 0;
  //           miliSeconds++;
  //         }
  //       }
  //     }
  //   });
  //   update();
  // }
}
