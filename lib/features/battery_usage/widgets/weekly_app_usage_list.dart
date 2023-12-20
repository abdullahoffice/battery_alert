import 'package:battery_alert/battery_alert.dart';

class WeeklyAppUsage extends GetWidget<BatteryUsageController> {
  const WeeklyAppUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: ListView.builder(
        itemCount: controller.infos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: const Color(0xff5E4694),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SvgPicture.asset(
                AppSvgs.emailIcon,
              ),
            ),
            title: Text(
              controller.infos[index].appName,
              style: BTextTheme.lightTextTheme.bodyMedium,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${controller.infos[index].usage.inMinutes} Min',
                      style: BTextTheme.lightTextTheme.bodyMedium,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '${controller.percentages[index].toStringAsFixed(0)} %',
                      style: BTextTheme.lightTextTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                LinearProgressIndicator(
                  value: 0.8,
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
