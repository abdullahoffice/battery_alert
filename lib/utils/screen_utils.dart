import '../battery_alert.dart';

class AppScreenUtils {
  static String formatBatteryHealth(String health) {
    String formattedHealth = health.toLowerCase().trim();

    switch (formattedHealth) {
      case "heath_good":
      case "good":
        return "Good";
      default:
        return "Unknown";
    }
  }

  static String getChargingStatus(ChargingStatus? chargingStatus) {
    if (chargingStatus == null) {
      return 'Unknown';
    }
    switch (chargingStatus) {
      case ChargingStatus.Charging:
        return 'Charging';
      case ChargingStatus.Discharging:
        return 'Discharging';
      case ChargingStatus.Full:
        return 'Full';
      case ChargingStatus.Unknown:
        return 'Unknown';
      default:
        return 'Not Charging';
    }
  }
}
