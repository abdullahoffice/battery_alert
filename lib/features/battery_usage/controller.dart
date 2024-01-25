import '../../battery_alert.dart';

class BatteryUsageController extends GetxController {
  //* Creating a singleton instance of the controller
  static final instance = Get.find<BatteryUsageController>();

  // Variables for Daily Usage Stats
  List<AppUsageInfo> dailyUsageApp = [];
  List<double> percentages = [];

  // Variables for Weekly Usage Stats
  List<AppUsageInfo> weeklyUsageApps = [];
  List<double> weeklyPercentages = [];

  // Variable for all app
  List dailyAllApps = [];
  List weeklyAllApps = [];

  //* Fetching Daily Usage Stats
  Future<void> getDailyUsageStats() async {
    try {
      debugPrint('Daily All Apps Length: ${dailyAllApps.length}');

      DateTime endDate = DateTime.now();
      DateTime startDate =
          DateTime(endDate.year, endDate.month, endDate.day, 0, 0, 0);
      dailyUsageApp = await AppUsage().getAppUsage(startDate, endDate);

      List<dynamic> apps = await getInstalledApps();
      List matchingApps = apps
          .where(
            (app) => dailyUsageApp
                .any((info) => info.packageName == app.packageName),
          )
          .toList();
      dailyUsageApp.sort((a, b) => a.packageName.compareTo(b.packageName));
      matchingApps.sort((a, b) => a.packageName.compareTo(b.packageName));
      dailyAllApps = matchingApps;

      update();
      debugPrint('Daily Info: ${dailyUsageApp.length}');
      debugPrint('daily appIcons: ${dailyAllApps.length}');

      double totalUsageInSeconds = dailyUsageApp.fold(
          0, (previous, info) => previous + info.usage.inSeconds.toDouble());
      percentages = dailyUsageApp
          .map((info) =>
              (info.usage.inSeconds.toDouble() / totalUsageInSeconds) * 100)
          .toList();
      update();
    } on DeviceApps catch (exception) {
      debugPrint('$exception');
    } on AppUsageException catch (exception) {
      debugPrint('$exception');
    }
  }

  //* Fetching Weekly Usage Stats
  Future<void> getWeeklyUsageStats() async {
    try {
      debugPrint('Daily All Apps Length: ${weeklyAllApps.length}');

      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(const Duration(days: 6));
      weeklyUsageApps = await AppUsage().getAppUsage(startDate, endDate);

      List<dynamic> apps = await getInstalledApps();

      List matchingApps = apps
          .where((app) => weeklyUsageApps
              .any((info) => info.packageName == app.packageName))
          .toList();

      weeklyUsageApps.sort((a, b) => a.packageName.compareTo(b.packageName));
      matchingApps.sort((a, b) => a.packageName.compareTo(b.packageName));
      weeklyAllApps = matchingApps;

      update();
      debugPrint('Weekly App Info: ${weeklyUsageApps.length}');
      debugPrint('Weekly App icon: ${weeklyAllApps.length}');

      double totalUsageInSeconds = weeklyUsageApps.fold(
          0, (previous, info) => previous + info.usage.inSeconds.toDouble());
      weeklyPercentages = weeklyUsageApps
          .map((info) =>
              (info.usage.inSeconds.toDouble() / totalUsageInSeconds) * 100)
          .toList();
      update();
    } on DeviceApps catch (exception) {
      debugPrint('DeviceAppsException: $exception');
    } on AppUsageException catch (exception) {
      debugPrint('AppUsageException: $exception');
    }
  }

  //*installed apps
  Future<List<dynamic>> getInstalledApps() async {
    try {
      List<dynamic> apps = await DeviceApps.getInstalledApplications(
        includeAppIcons: true,
        includeSystemApps: true,
      );

      return apps;
    } on DeviceApps catch (exception) {
      debugPrint('IconsExceptios$exception');
      return [];
    }
  }
}
