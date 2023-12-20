import '../../battery_alert.dart';

class BatteryUsageController extends GetxController {
  static final instance = Get.find<BatteryUsageController>();

  //*
  void usageOnTap() {}

  //*
  List<AppUsageInfo> infos = [];
  List<double> percentages = [];
  List<Widget> listWidgets = [
    const DailyAppUsage(),
    const WeeklyAppUsage(),
  ];
  int currentTab = 0;
  void setCurrentTab({required int c}) {
    currentTab = c;
    update();
  }

  Future<void> getUsageStats() async {
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate = DateTime(2023, 2, 1, 0, 0, 0);

      infos = await AppUsage().getAppUsage(startDate, endDate);
      update();
      // Calculate the total usage time
      double totalUsageInSeconds = infos.fold(
          0, (previous, info) => previous + info.usage.inSeconds.toDouble());

      // Create a list to store the calculated percentages

      // Calculate the percentage for each app and add it to the percentages list
      percentages = infos
          .map((info) =>
              (info.usage.inSeconds.toDouble() / totalUsageInSeconds) * 100)
          .toList();
    } on AppUsageException catch (exception) {
      debugPrint('$exception');
    }
  }
}

// List<BatteryUsageModel> convertAppUsageInfoToBatteryUsageModel(
//     List<AppUsageInfo> appUsageInfos) {
//   return appUsageInfos.map((info) {
//     return BatteryUsageModel(
//       image: 'YourImagePathHere', // Replace with the actual image path or URL
//       appName: info.appName,
//       min: info.usage.toString(), // Assuming 'min' corresponds to the usage in minutes
//       percentage: '80%', // Replace with the actual percentage calculation
//     );
//   }).toList();
// }
