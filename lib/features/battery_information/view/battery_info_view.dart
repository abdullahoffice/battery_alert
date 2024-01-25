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
        initState: (state) {
          controller.updateBatteryInformation(AndroidBatteryInfo());
        },
        builder: (_) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              decoration: AppDecorations.backgroundImageDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NavigationHeader(title: 'Battery Information'),

                    //*
                    // const SizedBox(height: 20),
                    // const BatteryProgressWidget(),
                    Container(
                      height: 210.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xff0FD46D),
                        boxShadow: [
                          AppDecorations.batteryProgressShadow,
                        ],
                      ),
                      child: Center(
                        child: Container(
                          height: 203.h,
                          decoration: const BoxDecoration(
                            color: Color(0xff190051),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              height: 175.h,
                              decoration: const BoxDecoration(
                                color: Color(0xff0FD46D),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  height: 155.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff1C005B),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height: 110.h,
                                      width: 73.w,
                                      child: StreamBuilder(
                                        stream: BatteryInfoPlugin()
                                            .androidBatteryInfoStream,
                                        builder: (context,
                                            AsyncSnapshot<dynamic> snapshot) {
                                          if (snapshot.hasData) {
                                            return LiquidLinearProgressIndicator(
                                              value: double.parse(
                                                  '${snapshot.data!.batteryLevel! / 100}%'),
                                              valueColor:
                                                  const AlwaysStoppedAnimation(
                                                Color(0xff0FD46D),
                                              ),
                                              backgroundColor: Colors.white,
                                              borderColor:
                                                  const Color(0xff0FD46D),
                                              borderWidth: 1.0,
                                              borderRadius: 10.0,
                                              direction: Axis.vertical,
                                              center: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    snapshot.data!.batteryLevel
                                                        .toString(),
                                                    style: BTextTheme
                                                        .lightTextTheme
                                                        .headlineSmall
                                                        ?.copyWith(
                                                      color: AppColors
                                                          .backgroundColor,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    child: Text(
                                                      '%',
                                                      style: BTextTheme
                                                          .lightTextTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                        color: AppColors
                                                            .backgroundColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //*
                    // const SizedBox(height: 20),
                    Column(
                      children: [
                        const RemainingTime(),
                        Text(
                          'Remaining',
                          style: BTextTheme.lightTextTheme.bodyLarge,
                        ),
                      ],
                    ),

                    //*
                    SizedBox(height: 4.h),

                    //*Grid
                    SizedBox(height: 4.h),
                    SizedBox(
                      height: 370.h,
                      child: const BatteryInfoGrid(),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          );
        },
      );
}

class RemainingTime extends StatelessWidget {
  const RemainingTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AndroidBatteryInfo?>(
      future: BatteryInfoPlugin().androidBatteryInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${(snapshot.data!.chargeTimeRemaining! / 1000 / 60 / 60).truncate()}',
                style: BTextTheme.lightTextTheme.labelLarge!
                    .copyWith(fontSize: 34.sp),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Text('Hour', style: BTextTheme.lightTextTheme.bodyLarge),
              ),
              SizedBox(width: 8.h), // Adjust the spacing between Hour and Min
              Text(
                '${(snapshot.data!.chargeTimeRemaining! / 1000 / 60 % 60).truncate()}',
                style: BTextTheme.lightTextTheme.labelLarge!
                    .copyWith(fontSize: 34.sp),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text('Min', style: BTextTheme.lightTextTheme.bodyLarge),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
