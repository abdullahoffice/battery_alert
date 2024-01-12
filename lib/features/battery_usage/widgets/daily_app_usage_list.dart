import '../../../battery_alert.dart';

class DailyBatteryUsage extends StatelessWidget {
  final BatteryUsageController controller;

  const DailyBatteryUsage({Key? key, required this.controller})
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
                color: AppColors.backgroundColor,
              ),
            )
          : ListView.builder(
              itemCount: controller.infos.length,
              itemBuilder: (BuildContext context, int index) {
                if (index < controller.infos.length) {
                  return ListTile(
                    leading: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: const Color(0xff5E4694),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Image.memory(controller.phoneApps[index].icon),
                    ),
                    title: Text(
                      controller.infos.isNotEmpty
                          ? controller.infos[index].appName
                          : "N/A",
                      style: BTextTheme.lightTextTheme.bodyMedium,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              controller.infos.isNotEmpty
                                  ? '${controller.infos[index].usage.inMinutes} Min'
                                  : 'N/A',
                              style: BTextTheme.lightTextTheme.bodyMedium,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              controller.infos.isNotEmpty
                                  ? '${controller.percentages[index].toStringAsFixed(0)} %'
                                  : 'N/A',
                              style: BTextTheme.lightTextTheme.bodyMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        LinearProgressIndicator(
                          value: controller.infos.isNotEmpty
                              ? controller.percentages[index] / 100
                              : 1,
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
