import '../../../battery_alert.dart';

class PremiumView extends GetView<PremiumController> {
  const PremiumView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
      ),
    );
  }

  Widget get _body => GetBuilder<PremiumController>(
        builder: (_) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
            child: Column(
              children: [
                //*TopNavigationBar
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                  child: const PremiumHeader(),
                ),

                //*images
                const Expanded(
                  child: CrauselImages(),
                ),

                //*Bottom
                SizedBox(height: 10.h),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    width: double.infinity,
                    height: double.infinity,
                    color: AppColors.backgroundColor,
                    //TODO 2
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //*Dot
                          DotsIndicatorWidget(
                            dotsCounts: controller.premiumImages.length,
                          ),

                          //*joinPreText
                          _joinPremium,

                          //*Ads free text
                          SizedBox(height: 5.h),
                          Text(
                            'Ads Free And More ',
                            style: BTextTheme.lightTextTheme.labelLarge!
                                .copyWith(color: AppColors.yellowColor),
                          ),

                          //*PaymentCard
                          SizedBox(height: 5.h),

                          const PaymentCardWidget(),

                          //*SubscribeButton
                          SizedBox(height: 10.h),
                          const ButtonWidget(),

                          //*texts
                          SizedBox(height: 5.h),
                          Text(
                            'Recuring billing cancel any time',
                            style: BTextTheme.lightTextTheme.labelMedium,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'You can cancel your subscription or trial anytime by cancelling your subscription through your iTunes account settings, or it will automatically renew. This must be done 24 hours before the end of the trial or anv subscrintion period to avoid beina charaed.',
                            textAlign: TextAlign.center,
                            style:
                                BTextTheme.lightTextTheme.bodyMedium!.copyWith(
                              fontSize: 9.sp,
                            ),
                          ),
                          // const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );

  //*JoinPremiumText
  Widget get _joinPremium => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Join our',
            style: BTextTheme.lightTextTheme.headlineLarge,
          ),
          SizedBox(width: 8.w),
          Text(
            'Premium',
            style: BTextTheme.lightTextTheme.headlineLarge!.copyWith(
              color: AppColors.yellowColor,
            ),
          )
        ],
      );
}
