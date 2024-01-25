import '../../../battery_alert.dart';

class WeeklyBatteryUsage extends StatelessWidget {
  final BatteryUsageController controller;

  const WeeklyBatteryUsage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BatteryUsageController>(
        initState: (state) {},
        builder: (_) {
          return controller.weeklyUsageApps.isEmpty
              ? const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: AppColors.greenColor,
                    strokeWidth: 5,
                  ),
                )
              : Container(
                  // height: 400.h,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: ListView.builder(
                    itemCount: controller.weeklyUsageApps.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Container(
                          height: 50.h,
                          width: 40.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: const Color(0xff5E4694),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SizedBox(
                            height: 50.h,
                            width: 40.w,
                            child: controller.weeklyAllApps.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator.adaptive(
                                      backgroundColor: AppColors.greenColor,
                                      strokeWidth: 5,
                                    ),
                                  )
                                : Image.memory(
                                    controller.weeklyAllApps[index].icon,
                                  ),
                          ),
                        ),
                        title: Text(
                          controller.weeklyUsageApps.isNotEmpty
                              ? controller.weeklyUsageApps[index].appName
                              : 'N/A',
                          style: BTextTheme.lightTextTheme.bodyMedium,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  controller.weeklyUsageApps.isNotEmpty
                                      ? '${controller.weeklyUsageApps[index].usage.inMinutes} Min'
                                      : 'N/A',
                                  style: BTextTheme.lightTextTheme.bodyMedium,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  controller.weeklyUsageApps.isNotEmpty
                                      ? '${controller.weeklyPercentages[index].toStringAsFixed(0)} %'
                                      : 'N/A',
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
                      );
                    },
                  ),
                );
        });
  }
}
