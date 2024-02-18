import '../../../battery_alert.dart';

class AppBarView extends GetWidget {
  const AppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.lightGreen,
      color: AppColors.backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            iconPath: AppSvgs.settings,
            // onPress: () => Get.to(
            //   const SettingView(),
            // ),
            onPress: () => Get.toNamed(RouteName.settingsScreen),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Get.dialog(AdFreePopup()),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.iconButtonColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
              child: Row(
                children: [
                  Text(
                    'Ad Free',
                    style: Theme.of(Get.context!).textTheme.titleSmall,
                  ),
                  const Image(
                    image: AssetImage('assets/images/crown.png'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          //*
          CustomIconButton(
            iconPath: AppSvgs.feedBackIcon,
            onPress: () => Get.dialog(const RateUsPopup()),
          ),
          // CustomIconButt(iconPath: 'assets/images/rateIcon.png', onPress: () {}, customIconPath: '',),
        ],
      ),
    );
  }
}
