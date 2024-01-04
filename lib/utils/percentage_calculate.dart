import '../battery_alert.dart';

class PercentageCalculator {
  static double calculatePercentageDifference(String pluginPercentage, String plugoutPercentage) {
    try {
      if (pluginPercentage.isNotEmpty && plugoutPercentage.isNotEmpty) {
        double pluginValue = double.parse(pluginPercentage);
        double plugoutValue = double.parse(plugoutPercentage);

        pluginValue = pluginValue.clamp(0.0, 100.0);
        plugoutValue = plugoutValue.clamp(0.0, 100.0);

        return (plugoutValue - pluginValue).abs();
      } else {
        debugPrint('One or both percentages are empty');
        return 0.0;
      }
    } catch (e) {
      debugPrint('Error parsing percentage difference: $e');
      return 0.0;
    }
  }
}