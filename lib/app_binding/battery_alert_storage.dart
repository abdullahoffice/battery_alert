import '../battery_alert.dart';

class BatteryAlertStorage {
  static BatteryAlertStorage? _instance;
  late SharedPreferences _preferences;

  BatteryAlertStorage._();

  static Future<BatteryAlertStorage> getInstance() async {
    _instance ??= BatteryAlertStorage._();
    _instance!._preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  //*GetAnimationBoolValue
  Future<Either<String, bool?>> getAnimationValue() async {
    try {
      final bool? isregister =
          _preferences.getBool(SharedPreferencesKeys.isOn);
      return right(isregister);
    } catch (e) {
      return left('Fail to get bool data');
    }
    
  }

  //*setAnimationData
  Future<Either<String, void>> setAnimationValue({required bool isregister}) async {
    try {
      await _preferences.setBool(
          SharedPreferencesKeys.isOn, isregister);
      return right(null);
    } catch (e) {
      return left('Fail to set bool data');
    }
  }

  //*GetAlarmBoolValue
  // Future<Either<String, bool?>> getAlarmValue() async {
  //   try {
  //     final bool? isregister =
  //         _preferences.getBool(SharedPreferencesKeys.isAlarmOn);
  //     return right(isregister);
  //   } catch (e) {
  //     return left('Fail to get bool data');
  //   }
  // }
  

  //*setAlarmData
  // Future<Either<String, void>> setAlarmValue({required bool isregister}) async {
  //   try {
  //     await _preferences.setBool(
  //         SharedPreferencesKeys.isAlarmOn, isregister);
  //     return right(null);
  //   } catch (e) {
  //     return left('Fail to set bool data');
  //   }
  // }

  //Animation Gif setter
  Future<Either<String, void>> saveSelectedImage(
      {required String imagePath}) async {
    try {
      await _preferences.setString(
          SharedPreferencesKeys.selectImageKey, imagePath);

      return right(null);
    } catch (e) {
      return left('Fail to set string data');
    }
  }

  //Animation Gif getter
  Future<Either<String, String?>> getSelectedImage() async {
    try {
      final String? imagePath =
          _preferences.getString(SharedPreferencesKeys.selectImageKey);
      debugPrint('GetMethod: $imagePath');
      return right(imagePath);
    } catch (e) {
      debugPrint('Error: $e');
      return left('Fail to get Fetch data');
    }
  }

  // Charging History Setter
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

  // Charging History Getter
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

  //*set animation switch value
  // Future<Either<String, void>> setAnimationValue({required bool isOn}) async {
  //   try {
  //     await _preferences.setBool(SharedPreferencesKeys.isOn, isOn);
  //     return right(null);
  //   } catch (e) {
  //     return left('Fail to set bool data');
  //   }
  // }

  // //*get animation value
  // Future<Either<String, bool?>> getAnimationValue() async {
  //   try {
  //     final bool? isregister =
  //         _preferences.getBool(SharedPreferencesKeys.isOn);
  //     return right(isregister);
  //   } catch (e) {
  //     return left('Fail to get bool data');
  //   }
  // }
}
