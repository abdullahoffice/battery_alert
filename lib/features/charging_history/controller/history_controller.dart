import '../../../battery_alert.dart';

class ChargingHistoryController extends GetxController {
  static final instance = Get.find<ChargingHistoryController>();
  // BatteryInfoHandler controller = BatteryInfoHandler();

  //*Timer
  void addTime() {
    const addSeconds = 1;
    final seconds = duration.inSeconds + addSeconds;
    duration = Duration(seconds: seconds);
  }

  final s = Stream.periodic(const Duration(seconds: 1)).asBroadcastStream();
  StreamSubscription? subscription;
  void startTimer() {
    if (subscription == null || subscription!.isPaused) {
      subscription = s.listen((_) {
        addTime();
        update();
      });
    }
  }

  void stopTimer() {
    subscription?.cancel();
    subscription = null;
    duration = const Duration();
  }

  var battery = Battery();
  bool isCharging = false;
  @override
  Future<void> onInit() async {
    super.onInit();

    // Start&StopTimer
    if (subscription == null) {
      Battery().onBatteryStateChanged.listen((BatteryState state) {
        if (state == BatteryState.charging) {
          startTimer();
        } else {
          stopTimer();
        }
        isCharging = state == BatteryState.charging;
      });
    }
  }

  //*Formatted Time for UI
  Duration duration = const Duration();
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String get hours => twoDigits(duration.inHours);
  String get minutes => twoDigits(duration.inMinutes.remainder(60));
  String get seconds => twoDigits(duration.inSeconds.remainder(60));

  //*Set Model
  Future<void> setChargHistory(
      {required List<ChargingHistoryModel> history}) async {
    final result = await BatteryAlertStorage.getInstance();
    final data = await result.setChargingHistory(history: history);

    data.fold(
      (errorMessage) {
        Fluttertoast.showToast(msg: errorMessage);
      },
      (r) => null,
    );
    update();
  }

  //*Get Model
  ChargingHistoryModel model = ChargingHistoryModel();
  List<ChargingHistoryModel> historyList = [];
  Future<void> getCharhistory() async {
    final result = await BatteryAlertStorage.getInstance();
    final data = result.getChargingHistory();

    data.fold((errorMessage) {
      Fluttertoast.showToast(msg: errorMessage);
    }, (fetchedData) {
      historyList = fetchedData;
      Fluttertoast.showToast(msg: 'Data Fetched');
    });

    update();
  }

  //* Charging History Data
  String plugInTime = '';
  String plugOutTime = '';
  String plugInDate = '';
  String plugOutDate = '';
  String pluginPercentage = '';
  String plugoutPercentage = '';
  bool chargerPluggedIn = false;

  void startListening() {
    BatteryInfoPlugin().androidBatteryInfoStream.listen((batteryInfo) {
      if (batteryInfo != null) {
        handleBatteryInfo(batteryInfo);
      }
    });
  }

  void handleBatteryInfo(AndroidBatteryInfo batteryInfo) {
    switch (batteryInfo.chargingStatus) {
      case ChargingStatus.Charging:
        handleCharging(batteryInfo);
        break;
      case ChargingStatus.Discharging:
        handleDischarging(batteryInfo);
        break;
      case ChargingStatus.Full:
      case ChargingStatus.Unknown:
      case null:
        // handle other cases if needed
        break;
    }
  }

  void handleCharging(AndroidBatteryInfo batteryInfo) {
    if (!chargerPluggedIn) {
      plugInTime = DateFormat('HH:mm:ss').format(DateTime.now());
      plugInDate = DateFormat('MMM d').format(DateTime.now());
      pluginPercentage = batteryInfo.batteryLevel.toString();
      debugPrint("Plug in time: $plugInTime");
      chargerPluggedIn = true;
    }
  }

  //*....
  Future<void> handleDischarging(AndroidBatteryInfo batteryInfo) async {
    if (chargerPluggedIn) {
      plugOutTime = DateFormat('HH:mm:ss').format(DateTime.now());
      plugOutDate = DateFormat('MMM d').format(DateTime.now());
      plugoutPercentage = batteryInfo.batteryLevel.toString();
      debugPrint('Plugged out: $plugOutTime');

      chargerPluggedIn = false;

      //* Calculate charging time
      var chargedTime = calculateChargingTime(
        plugInTime: plugInTime,
        plugOutTime: plugOutTime,
      );

      final historyModel = ChargingHistoryModel(
        title: 'Charged for $chargedTime',
        percentTitle: getPercentageDifference().toString(),
        plugIn: 'Plug in',
        time: plugInTime,
        date: plugInDate,
        plugOut: 'Plug out',
        time2: plugOutTime,
        date2: plugOutDate,
        startPercentage: '$pluginPercentage%',
        endPercentage: '$plugoutPercentage%',
      );

      // Retrieve existing history
      final historyStorage = await BatteryAlertStorage.getInstance();
      // final existingHistoryData = await ChargingHistoryController.instance.getCharhistory(); //test with this
      final existingHistoryData = historyStorage.getChargingHistory();
      existingHistoryData.fold(
        (errorMessage) {
          debugPrint('Error: retrieving existing history: $errorMessage');
        },
        (existingHistoryList) {
          // Add existing history to historyList
          historyList.addAll(existingHistoryList);
        },
      );

      // Add new historyModel
      historyList.add(historyModel);

      // Remove duplicates from historyList
      historyList = historyList.toSet().toList();

      // Save updated historyList
      await setChargHistory(
        history: historyList,
      );
      // debugPrint(
      //     'historyy: ${ChargingHistoryController.instance.historyList.length}');
      // historyList.addAll(historyList);
      // ChargingHistoryController.instance.update();
      update();
    }
  }

  //*ForamtTime
  String get formattedTime =>
      [hours, minutes, seconds].where((part) => part != '00').join(':');

  double getPercentageDifference() {
    return PercentageCalculator.calculatePercentageDifference(
        pluginPercentage, plugoutPercentage);
  }

  //*ClearData
  Future<void> clearChargingHistory() async {
    final storageInstance = await BatteryAlertStorage.getInstance();

    await storageInstance.clearChargingHistory();

    // ChargingHistoryController.instance.historyList = [];
    historyList.clear();
    // ChargingHistoryController.instance.update();
    update();
    Fluttertoast.showToast(msg: 'Charging history data cleared');
  }

  //*ChargingTime
  String calculateChargingTime({
    required String plugInTime,
    required String plugOutTime,
  }) {
    try {
      DateTime plugInDateTime = DateFormat('HH:mm:ss').parse(plugInTime);
      DateTime plugOutDateTime = DateFormat('HH:mm:ss').parse(plugOutTime);

      Duration chargingDuration = plugOutDateTime.difference(plugInDateTime);

      String formattedDuration = [
        chargingDuration.inHours.toString().padLeft(2, '0'),
        (chargingDuration.inMinutes % 60).toString().padLeft(2, '0'),
        (chargingDuration.inSeconds % 60).toString().padLeft(2, '0'),
      ].where((part) => part != '00').join(':');
      if (formattedDuration.endsWith(':00')) {
        formattedDuration =
            '${formattedDuration.substring(0, formattedDuration.length - 3)}s';
      }
      return formattedDuration;
    } catch (e) {
      debugPrint('Error calculating charging time: $e');
      return '';
    }
  }
}


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
