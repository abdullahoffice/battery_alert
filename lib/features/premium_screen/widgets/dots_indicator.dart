import '../../../battery_alert.dart';

class DotsIndicatorWidget extends GetWidget<PremiumController> {
  final int dotsCounts;
  const DotsIndicatorWidget({required this.dotsCounts, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PremiumController>(builder: (_) {
      return DotsIndicator(
        dotsCount: _.premiumImages.length,
        position: controller.currentImageIndex,
        decorator: const DotsDecorator(
          color: Colors.grey, // Inactive dot color
          activeColor: AppColors.lightGreen, // Active dot color
        ),
      );
    });
  }
}
