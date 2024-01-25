import '../../../battery_alert.dart';

class ChargerTestingView extends GetView<ChargerTestingController> {
  const ChargerTestingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: const CustomAppBar(title: 'Charger Testing'),
        ),
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
                    //*
                    SizedBox(height: 20.h),
                    StreamBuilder<AndroidBatteryInfo?>(
                      stream: BatteryInfoPlugin().androidBatteryInfoStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomContainer(
                                      valueText: 'Min Value',
                                      value: '${controller.calculateMinCurrent(
                                        snapshot.data?.currentNow!.toDouble(),
                                        snapshot.data?.currentAverage!
                                            .toDouble(),
                                      )} mA'),
                                  CustomContainer(
                                      valueText: 'Current',
                                      value:
                                          '${(snapshot.data?.currentNow)! / 1000} mAh'),
                                  CustomContainer(
                                      valueText: 'Max Value',
                                      value:
                                          '${(snapshot.data?.voltage)! / 1000} V'),
                                ],
                              ),
                              //*CircularBattery   
                              SizedBox(height: 40.h),
                              const BatteryProgressWidget(),

                              //*
                              SizedBox(height: 50.h),
                              Text(
                                controller.isTimerRunning
                                    ? 'Charger Status: ${AppScreenUtils.getChargingStatus(snapshot.data?.chargingStatus)}'
                                    : 'Charger quality: ${controller.calculateChargerStatus() ?? 'N/A'}',
                                style: BTextTheme.lightTextTheme.bodyMedium,
                              ),

                              //*
                              SizedBox(height: 25.h),
                              const TimerButton(),

                              //*
                              SizedBox(height: 34.h),
                              _nativeAdsWidget,
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator(
                            color: AppColors.greenColor,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

  //*Ads
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
