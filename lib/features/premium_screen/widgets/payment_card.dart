import '../../../battery_alert.dart';

class PaymentCardWidget extends GetWidget<PremiumController> {
  const PaymentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PremiumController>(builder: (_) {
      return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              ...List.generate(
                // controller.premiumData.length,
                // TODO # 1: Change the lenght
                _.products.length,

                (index) => GestureDetector(
                  onTap: () {
                    _.setIndex(index);
                    debugPrint(
                      // This selected index will goes to button
                      'SelectedIndex: ${_.currentIndex}',
                    );
                    // _.setIndex(index);
                  },
                  child: Card(
                    color: _.currentIndex == index
                        ? AppColors.lightGreen
                        : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      side: BorderSide(
                        width: 1.w,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: Row(
                        children: [
                          // const DotsIndicatorWidget(dotsCounts: 1),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // TODO # 2: Add data from google console

                              //.....
                              Text(
                                _.products[index].description,
                                style: BTextTheme.lightTextTheme.titleSmall,
                              ),
                              Text(
                                _.products[index].description,
                                style: BTextTheme.lightTextTheme.titleSmall,
                              ),
                              //.....
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
                          Column(
                            children: [
                              Text(
                                controller.premiumData[index].price,
                                style: BTextTheme.lightTextTheme.labelMedium!
                                    .copyWith(
                                  color: AppColors.yellowColor,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                decoration: BoxDecoration(
                                    color: AppColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  controller.premiumData[index].type,
                                  textAlign: TextAlign.center,
                                  style: BTextTheme.lightTextTheme.labelSmall,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ));
    });
  }
}
