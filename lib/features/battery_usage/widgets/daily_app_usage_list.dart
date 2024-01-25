import '../../../battery_alert.dart';

class DailyBatteryUsage extends StatelessWidget {
  final BatteryUsageController controller;

  const DailyBatteryUsage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BatteryUsageController>(
        initState: (state) {},
        builder: (_) {
          return controller.dailyUsageApp.isEmpty
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
                    itemCount: controller.dailyUsageApp.length,
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
                            child: controller.dailyAllApps.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator.adaptive(
                                      backgroundColor:
                                          AppColors.backgroundColor,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : Image.memory(
                                    controller.dailyAllApps[index].icon,
                                  ),
                          ),
                        ),
                        title: Text(
                          controller.dailyUsageApp.isNotEmpty
                              ? controller.dailyUsageApp[index].appName
                              : "N/A",
                          style: BTextTheme.lightTextTheme.bodyMedium,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  controller.dailyUsageApp.isNotEmpty
                                      ? '${controller.dailyUsageApp[index].usage.inMinutes} Min'
                                      : 'N/A',
                                  style: BTextTheme.lightTextTheme.bodyMedium,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  controller.dailyUsageApp.isNotEmpty
                                      ? '${controller.percentages[index].toStringAsFixed(0)} %'
                                      : 'N/A',
                                  style: BTextTheme.lightTextTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            LinearProgressIndicator(
                              value: controller.dailyUsageApp.isNotEmpty
                                  ? controller.percentages[index] / 100
                                  : 1,
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
