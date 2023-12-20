import '../../../battery_alert.dart';

class PremiumHeader extends GetWidget{
  const PremiumHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          CustomIconButton(
            iconPath: AppSvgs.backArrow,
            onPress: () {
              Get.back();
            },
          ),
          SizedBox(width: 30.w),
          Text(
            'Go Premium',
            style: BTextTheme.lightTextTheme.headlineLarge!
                .copyWith(color: AppColors.backgroundColor),
          ),
        ],
      );
  }
}