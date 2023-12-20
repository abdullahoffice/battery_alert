import '../../../battery_alert.dart';

class AdFreePopup extends StatelessWidget {
  const AdFreePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      // width: 300,
      child: AlertDialog(
        surfaceTintColor: AppColors.primaryColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage.asset(
              image: AppImages.crownImage,
            ),
            SizedBox(height: 10.h),
            Text(
              "Ad Free Version",
              textAlign: TextAlign.center,
              style: BTextTheme.darkTextTheme.headlineSmall,
            ),
            Text(
              "Contine to  purchase ad free version and use app without any advertisement interaction ",
              textAlign: TextAlign.center,
              style: BTextTheme.darkTextTheme.bodyMedium,
            ),
          ],
        ),
        actions: <Widget>[
          
          ElevatedButton(
            onPressed: () => Get.to(const PremiumView()),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: Text(
              'Yes, Buy the Ads free version!',
              style: BTextTheme.lightTextTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
