import '../battery_alert.dart';

class ChargingHistoryStorage {
  static ChargingHistoryStorage? _instance;
  late SharedPreferences _preferences;

  ChargingHistoryStorage._();

  static Future<ChargingHistoryStorage> getInstance() async {
    _instance ??= ChargingHistoryStorage._();
    _instance!._preferences = await SharedPreferences.getInstance();

    return _instance!;
  } 

  //*Setmodel saveHistory
  Future<Either<String, void>> setChargingHistory(
      {required List<ChargingHistoryModel> history}) async {
    try {
      final jsonList = history.map((model) => model.toJson()).toList();
      // debugPrint('SetChargingHistoryStorage: $jsonList');
      await _preferences.setString(
        SharedPreferencesKeys.modelKey,
        json.encode(jsonList),
      );
      // debugPrint('Listdata: $list');

      return right(null);
    } catch (e) {
      debugPrint('Errorr: $e');
      return left('Fail to set model data');
    }
  }

  //*Getmodel loadHistory
  Either<String, List<ChargingHistoryModel>> getChargingHistory() {
    try {
      final jsonString = _preferences.getString(SharedPreferencesKeys.modelKey);
      if (jsonString != null) {
        final List<dynamic> jsonList = json.decode(jsonString);
        // debugPrint('GetChargingHistoryStorage: $jsonList');
        return right(
          jsonList.map((json) => ChargingHistoryModel.fromJson(json)).toList(),
        );
      } else {
        return left('Charging history not found');
      }
    } catch (e) {
      return left('Fail to get charging history');
    }
  }

  Future<void> clearChargingHistory() async {
    try {
      await _preferences.remove(SharedPreferencesKeys.modelKey);
      debugPrint('Charging history data cleared');
    } catch (e) {
      debugPrint('Failed to clear charging history data: $e');
    }
  }
}
