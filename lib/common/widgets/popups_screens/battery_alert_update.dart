import '../../../battery_alert.dart';

class BatterAlertUpdates extends StatelessWidget {
  const BatterAlertUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: AlertDialog(
        surfaceTintColor: AppColors.primaryColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                AppImage.asset(
                  image: AppImages.batteryImage,height: 53.h,width: 53.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  "Bettery Alert",
                  textAlign: TextAlign.center,
                  style: BTextTheme.darkTextTheme.headlineSmall,
                ),
              ],
            ),
             SizedBox(height: 10.h),
            Text(
              "Would you like to check the update is available on play store",
              textAlign: TextAlign.center,
              style: BTextTheme.darkTextTheme.bodyMedium,
            ),
          ],
        ),
        actions: <Widget>[
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: const BorderSide(width: 1, color: AppColors.blackColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                )),
            child: Text(
              'Cancel',
              style: BTextTheme.darkTextTheme.bodyLarge,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
              ),
            ),
            child: Text(
              'Check',
              style: BTextTheme.lightTextTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
