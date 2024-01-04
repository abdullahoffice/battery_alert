import '../../../battery_alert.dart';

class ChargerTestingView extends GetView<ChargerTestingController> {
  const ChargerTestingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
      ),
    );
  }

  Widget get _body => GetBuilder<ChargerTestingController>(
        builder: (_) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: AppDecorations.backgroundImageDecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //*TopNavigationBar
                    SizedBox(height: 20.h),
                    const NavigationHeader(title: 'Charger Testing'),

                    //*
                    SizedBox(height: 20.h),
                    _testingValueList,

                    //*CircularBattery
                    SizedBox(height: 40.h),
                    const BatteryProgressWidget(),

                    //*
                    SizedBox(height: 50.h),
                    Text(
                      'Dis-Charging 3.782 Volt',
                      style: BTextTheme.lightTextTheme.bodyMedium,
                    ),

                    //*
                    SizedBox(height: 25.h),
                    testingButton(
                      ontap: () {
                        Get.dialog(const ConnectCharPopup());
                      },
                    ),

                    //*
                    SizedBox(height: 34.h),
                    _nativeAdsWidget,
                  ],
                ),
              ),
            ),
          );
        },
      );

  //*TestingValuesList
  Widget get _testingValueList => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            controller.charTestingData.length,
            (index) => Container(
              width: 104.w,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.purpleColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.charTestingData[index].valueText,
                    style: BTextTheme.lightTextTheme.titleSmall,
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    controller.charTestingData[index].value,
                    style: BTextTheme.lightTextTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  //*Testing button
  Widget testingButton({required VoidCallback ontap}) => GestureDetector(
        onTap: ontap,
        child: Container(
          width: 260.w,
          height: 77.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.purpleColor,
            boxShadow: [
              AppDecorations.smallWhiteBoxShadow,
              AppDecorations.smallboxShadow,
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text('Start Testing',
              style: BTextTheme.lightTextTheme.headlineSmall),
        ),
      );

  Widget get _nativeAdsWidget => GestureDetector(
        child: Container(
          width: 210.w,
          height: 160.h,
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(10.r)),
          child: Center(
            child: Text(
              'Native \nADS',
              textAlign: TextAlign.center,
              style: BTextTheme.lightTextTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 32.sp,
              ),
            ),
          ),
        ),
      );
}
