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
                //
                _appBar,

                //
                const CrauselImages(),

                //
                SizedBox(height: 10.h),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    width: double.infinity,
                    height: double.infinity,
                    color: AppColors.backgroundColor,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //
                          _joinPremium,

                          //
                          SizedBox(height: 5.h),
                          // Visibility(
                          //   visible: !_.isSubscribe,
                          //   child: Text('Showing Google Ads: ${_.isSubscribe}'),
                          // ),
                          // const SizedBox(height: 10),
                          // TextButton(
                          //   onPressed: () {
                          //     _.iApEngine.inAppPurchase.restorePurchases();
                          //   },
                          //   child: Text('Restored Purchase',style: BTextTheme.lightTextTheme.titleLarge,),
                          // ),
                          // const SizedBox(height: 10),
                          // _textAdsFree,

                          //
                          SizedBox(height: 5.h),
                          const PaymentCardWidget(),

                          //
                          SizedBox(height: 10.h),
                          const SubscriptionButton(),

                          //
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
                              fontSize: 9,
                            ),
                          ),
                          SizedBox(height: 10.h),
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

  Widget get _appBar => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
          vertical: 8.h,
        ),
        child: const PremiumHeader(),
      );
  Widget get _textAdsFree => Text(
        'Ads Free And More ',
        style: BTextTheme.lightTextTheme.labelLarge!
            .copyWith(color: AppColors.yellowColor),
      );
}
