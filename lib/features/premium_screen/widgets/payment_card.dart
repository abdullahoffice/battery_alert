import '../../../battery_alert.dart';

class PaymentCardWidget extends GetWidget<PremiumController> {
  const PaymentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            ...List.generate(
              controller.premiumData.length,
              // debugPrint('');
              (index) => Card(
                color: AppColors.darkBlueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: BorderSide(
                    width: 1.w,
                    color: AppColors.primaryColor,
                  ),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    children: [
                      const DotsIndicatorWidget(dotsCounts: 1),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.premiumData[index].timePeriod,
                            
                            style: BTextTheme.lightTextTheme.titleSmall,
                          ),
                          
                          Text(
                           controller.premiumData[index].payFor,
                            style: BTextTheme.lightTextTheme.labelMedium,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        controller.premiumData[index].price,
                        style: BTextTheme.lightTextTheme.labelMedium!.copyWith(
                          color: AppColors.yellowColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
