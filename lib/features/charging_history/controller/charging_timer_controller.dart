import '../../../battery_alert.dart';

class ChargingTimerController extends GetxController {
  Timer? _timer;
  

  void startChargingTimer(Function addTimeCallback) {
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        addTimeCallback();
      });
    }
  }

  void stopChargingTimer() {
    _timer?.cancel();
  }
}

