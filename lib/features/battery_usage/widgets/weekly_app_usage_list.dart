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
      child: controller.infos.isEmpty
          ? const Center(
              // Show loading indicator when the list is empty
              child: CircularProgressIndicator(
                color: AppColors.greenColor,
              ),
            )
          : ListView.builder(
              itemCount: controller.weeklyInfos!.length,
              itemBuilder: (BuildContext context, int index) {
                if (index < controller.weeklyInfos!.length) {
                  return ListTile(
                    leading: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
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
                      controller.weeklyInfos.isNotEmpty
                          ? controller.weeklyInfos[index].appName
                          : 'N/A',
                      style: BTextTheme.lightTextTheme.bodyMedium,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              controller.weeklyInfos.isNotEmpty
                                  ? '${controller.weeklyInfos[index].usage.inMinutes} Min'
                                  : 'N/A',
                              style: BTextTheme.lightTextTheme.bodyMedium,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              controller.weeklyInfos.isNotEmpty
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
                    onTap: () {},
                  );
                } else {
                  return Container(); // or any other fallback widget
                }
              },
            ),
    );
  }
}
