import '../../../battery_alert.dart';

class BatteryInfoHandler extends GetxController {
  late List<ChargingHistoryModel> historyList = [];

  static final instance = Get.find<BatteryInfoHandler>();

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

      //*
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
      final historyStorage = await ChargingHistoryStorage.getInstance();
      // final existingHistoryData = await ChargingHistoryController.instance.getCharhistory(); //test with this
      final existingHistoryData = historyStorage.getChargingHistory();
      existingHistoryData.fold(
        (errorMessage) {
          debugPrint('Error: retrieving existing history: $errorMessage');
        },
        (existingHistoryList) {
          historyList.addAll(existingHistoryList);
        },
      );
      historyList.add(historyModel);
      historyList = historyList.toSet().toList(); //removes duplicates from list
      await ChargingHistoryController.instance
          .setChargHistory(history: historyList);
      debugPrint('historyy: ${historyList.length}');
      ChargingHistoryController.instance.historyList.addAll(historyList);
      ChargingHistoryController.instance.update();
    }
  }

  //*ForamtTime
  String get formattedTime => [
        ChargingHistoryController.instance.hours,
        ChargingHistoryController.instance.minutes,
        ChargingHistoryController.instance.seconds
      ].where((part) => part != '00').join(':');

  double getPercentageDifference() {
    return PercentageCalculator.calculatePercentageDifference(
        pluginPercentage, plugoutPercentage);
  }

  //*ClearData
  Future<void> clearChargingHistory() async {
    final storageInstance = await ChargingHistoryStorage.getInstance();

    await storageInstance.clearChargingHistory();

    historyList = [];
    ChargingHistoryController.instance.historyList.clear();
    ChargingHistoryController.instance.update();
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
