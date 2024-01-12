import '../../battery_alert.dart';

class BatteryUsageController extends GetxController {
  static final instance = Get.find<BatteryUsageController>();

  //*
  List<AppUsageInfo> infos = [];
  List<double> percentages = [];

  List<AppUsageInfo> weeklyInfos = [];
  List<double> weeklyPercentages = [];
  List phoneApps = [];

  Future<void> getAppIcons() async {
    try {
      List apps = await DeviceApps.getInstalledApplications(
        // onlyAppsWithLaunchIntent: true,
        includeAppIcons: true,
        includeSystemApps: true,
      );
      phoneApps = apps;
      debugPrint('apps: ${phoneApps.length}');
      update();
    } on DeviceApps catch (exception) {
      debugPrint('$exception');
    }
  }

  // List<Widget> listWidgets = [
  //   // const DailyAppUsage(),
  //   // const WeeklyAppUsage(),
  // ];
  int currentTab = 0;
  void setCurrentTab({required int c}) {
    currentTab = c;
    update();
  }

  Future<void> getDailyUsageStats() async {
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate =
          DateTime(endDate.year, endDate.month, endDate.day, 0, 0, 0);

      infos = await AppUsage().getAppUsage(startDate, endDate);
      debugPrint('Info: ${infos.length}');
      update();
      // Calculate the total usage time
      double totalUsageInSeconds = infos.fold(
          0, (previous, info) => previous + info.usage.inSeconds.toDouble());
      // Calculate the percentage
      percentages = infos
          .map((info) =>
              (info.usage.inSeconds.toDouble() / totalUsageInSeconds) * 100)
          .toList();
      update();
    } on AppUsageException catch (exception) {
      debugPrint('$exception');
    }
  }

  Future<void> getWeeklyUsageStats() async {
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(const Duration(days: 6));
      weeklyInfos = await AppUsage().getAppUsage(startDate, endDate);
      update();
      // Calculate the total usage time
      double totalUsageInSeconds = weeklyInfos.fold(
          0, (previous, info) => previous + info.usage.inSeconds.toDouble());
      // Calculate the percentage
      weeklyPercentages = weeklyInfos
          .map((info) =>
              (info.usage.inSeconds.toDouble() / totalUsageInSeconds) * 100)
          .toList();
      update();
    } on AppUsageException catch (exception) {
      debugPrint('$exception'); 
    }
  }
}
