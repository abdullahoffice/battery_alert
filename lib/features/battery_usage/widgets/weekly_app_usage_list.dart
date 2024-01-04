import '../../../battery_alert.dart';

class WeeklyBatteryUsage extends StatelessWidget {
  final BatteryUsageController controller;

  const WeeklyBatteryUsage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: ListView.builder(
        itemCount: controller.weeklyInfos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: const Color(0xff5E4694),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.memory(
                controller.phoneApps[index] is ApplicationWithIcon
                    ? controller.phoneApps[index].icon
                    : null,
              ),
            ),
            title: Text(
              controller.weeklyInfos[index].appName,
              style: BTextTheme.lightTextTheme.bodyMedium,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${controller.weeklyInfos[index].usage.inMinutes} Min',
                      style: BTextTheme.lightTextTheme.bodyMedium,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '${controller.weeklyPercentages[index].toStringAsFixed(0)} %',
                      style: BTextTheme.lightTextTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                LinearProgressIndicator(
                  value: controller.weeklyPercentages[index] / 100,
                  minHeight: 9.h,
                  borderRadius: BorderRadius.circular(10.r),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.secondaryColor),
                ),
              ],
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
