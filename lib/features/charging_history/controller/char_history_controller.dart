import '../../../battery_alert.dart';

class ChargingHistoryController extends GetxController {
  static final instance = Get.find<ChargingHistoryController>();

  //*Timer
  void addTime() {
    const addSeconds = 1;
    final seconds = duration.inSeconds + addSeconds;
    duration = Duration(seconds: seconds);
  }

  //*
  final s = Stream.periodic(const Duration(seconds: 1));
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

    // subscription!.pause();
    // duration = const Duration();
  }

  //*init
  var battery = Battery();
  bool isCharging = false;
  @override
  Future<void> onInit() async {
    super.onInit();
    // instance of shared pref
    // final result = await ChargingHistoryStorage.getInstance();
    // result.getChargingHistory();

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

  //*FormattedTimeForUI
  Duration duration = const Duration();
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String get hours => twoDigits(duration.inHours);
  String get minutes => twoDigits(duration.inMinutes.remainder(60));
  String get seconds => twoDigits(duration.inSeconds.remainder(60));

  //*setModel
  List<ChargingHistoryModel> myHistoryList = [];
  Future<void> setChargHistory(
      {required List<ChargingHistoryModel> history}) async {
    
    final result = await ChargingHistoryStorage.getInstance();
    final data = await result.setChargingHistory(history: history);

    data.fold(
      (errorMessage) {
        Fluttertoast.showToast(msg: errorMessage);
      },
      (r) => null,
    );  
    update();
    // debugPrint('historyy: $myHistoryList');
  }

  //*getModel
  ChargingHistoryModel model = ChargingHistoryModel();
  List<ChargingHistoryModel> historyList = [];
  Future<void> getCharhistory() async {
    final result = await ChargingHistoryStorage.getInstance();
    final data = result.getChargingHistory();

    data.fold((errorMessage) {
      Fluttertoast.showToast(msg: errorMessage);
    }, (fetchedData) {
      historyList = fetchedData;
      Fluttertoast.showToast(msg: 'Data Fetched');
    });

    update();
    // debugPrint('Model: ${result.getChargingHistory()}');
  }
}
