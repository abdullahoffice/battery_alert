import '../../../battery_alert.dart';

class SubscriptionButton extends GetWidget<PremiumController> {
  const SubscriptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PremiumController>(builder: (_) {
      return InkWell(
        onTap: () {
          if (_.products.isEmpty) {
            // Handle the case where there are no products
            debugPrint('No products available for purchase.');
            // Display a user-friendly message or take other appropriate action
          } else {
            debugPrint('SelectedIndex: ${_.currentIndex}');
            _.iApEngine.handlePurchase(
              _.products[_.currentIndex],
              _.productIds,
            );
          }
        },
        child: Container(
          width: 190,
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.greenColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              'Subscribe',
              style: BTextTheme.lightTextTheme.titleMedium,
            ),
          ),
        ),
      );
    });
  }
}
