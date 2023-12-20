import '../../../battery_alert.dart';

class BatteryInfoView extends GetView<BatteryViewController> {
  const BatteryInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
      ),
    );
  }

  Widget get _body => GetBuilder<BatteryViewController>(
        builder: (_) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              decoration: AppDecorations.backgroundImageDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
                child: Column(
                  children: [
                    const NavigationHeader(title: 'Battery Information'),
                    Expanded(
                      ///TODO 1
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //*
                            SizedBox(height: 12.h),
                            const BatteryPogressWidget(),
                        
                            //*
                            // SizedBox(height: 6.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '23',
                                  style: BTextTheme.lightTextTheme.labelLarge!
                                      .copyWith(fontSize: 34.sp),
                                ),
                                Text(
                                  'Hour',
                                  style: BTextTheme.lightTextTheme.headlineSmall!
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  '6',
                                  style: BTextTheme.lightTextTheme.labelLarge!
                                      .copyWith(fontSize: 34.sp),
                                ),
                                Text(
                                  'Min',
                                  style: BTextTheme.lightTextTheme.headlineSmall!
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Text('Remaining',
                                style: BTextTheme.lightTextTheme.bodyLarge),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      // flex: 2,
                      child: GridView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 5.h),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 9.h,
                          crossAxisCount: 2,
                          childAspectRatio: 2.8,
                        ),
                        itemCount: controller.batterInformationData.length,
                        itemBuilder: (context, int index) {
                          return Container(
                            width: 140.w,
                            height: 62.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              boxShadow: [
                                AppDecorations.smallWhiteBoxShadow,
                                AppDecorations.smallboxShadow,
                              ],
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // SvgPicture.asset(
                                //   controller.batterInformationData[index].icon,
                                //   height: 20.h,
                                // ),
                                SvgPicture.asset(
                                  controller.batterInformationData[index].icon,
                                ),
                                const SizedBox(width: 20),
                                SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .batterInformationData[index].title,
                                        textAlign: TextAlign.left,
                                        style: BTextTheme
                                            .lightTextTheme.labelLarge,
                                      ),
                                      Text(
                                        controller.batterInformationData[index]
                                            .subTitle,
                                        textAlign: TextAlign.left,
                                        style: BTextTheme
                                            .lightTextTheme.labelLarge!
                                            .copyWith(
                                                color:
                                                    AppColors.secondaryColor),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
