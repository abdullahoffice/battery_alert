import '../../../battery_alert.dart';

class ButtonWidget extends GetWidget<PremiumController> {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 190,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child:  Center(
          child: Text(
            'Subscribe',
            style: BTextTheme.lightTextTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
