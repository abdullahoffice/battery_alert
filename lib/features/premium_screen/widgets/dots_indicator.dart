import '../../../battery_alert.dart';

class DotsIndicatorWidget extends GetWidget<PremiumController> {
  final int dotsCounts;
  const DotsIndicatorWidget( {required this.dotsCounts,super.key});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCounts,
      position: controller.currentIndex,
      decorator: DotsDecorator(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1.w),
          borderRadius: BorderRadius.circular(25.0.r),
        ),
        color: Colors.transparent, // Inactive color
        activeColor: AppColors.primaryColor,
      ),
    );
  }
}
