import '../../../battery_alert.dart';

AndroidDeviceInfoModel androidVersion = AndroidDeviceInfoModel();

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
          controller.fetchDeviceInformation();
        },
        builder: (_) {
          return SizedBox(
            height: double.infinity,
            child: Container(
              decoration: AppDecorations.backgroundImageDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 18.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NavigationHeader(title: 'Battery Information'),
                    _verticalSpace,
                    // const BatteryProgressWidget(),
                    StreamBuilder<AndroidBatteryInfo?>(
                      stream: GlobalController
                          .instance.batteryInfoPlugin.androidBatteryInfoStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final batteryLevel = snapshot.data!.batteryLevel;
                          final totalCapacity = snapshot.data!.batteryCapacity;
                          final batteryCapacity =
                              batteryLevel! + totalCapacity! ;

                          debugPrint('Battery Info: ${snapshot.data}');
                          return Column(
                            children: [
                              //*CircularBattery
                              // _verticalSpace,
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
                                                child:
                                                    LiquidLinearProgressIndicator(
                                                  value: double.parse(
                                                      '${snapshot.data!.batteryLevel! / 100}'),
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
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '${(snapshot.data!.batteryLevel!).toInt()}',
                                                        style: BTextTheme
                                                            .lightTextTheme
                                                            .headlineSmall
                                                            ?.copyWith(
                                                          color: AppColors
                                                              .backgroundColor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
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

                              //*Grid

                              _verticalSpace,
                              _remainingTime,
                              _verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      GridCardWidget(
                                        chargingStatus:
                                            AppScreenUtils.getChargingStatus(
                                          snapshot.data?.chargingStatus,
                                        ),
                                        title: 'Charging Status',
                                        // icon: 'assets/svgs/charger_icon2.svg',
                                        icon: AppSvgs.androidIcon,
                                      ),
                                      _verticalSpaceSmall,
                                      GridCardWidget(
                                        chargingStatus:
                                            '${snapshot.data!.voltage! / 1000}v',
                                        title: 'Voltage',
                                        // icon: AppSvgs.electricIcon,
                                        icon: AppSvgs.androidIcon,
                                      ),
                                      _verticalSpaceSmall,
                                      GridCardWidget(
                                        chargingStatus:
                                            "${snapshot.data!.temperature ?? 0}°C",
                                        title: 'Temperature',
                                        // icon: AppSvgs.temperatureIcon,
                                        icon: AppSvgs.androidIcon,
                                      ),
                                      _verticalSpaceSmall,
                                      GridCardWidget(
                                        chargingStatus:
                                            '${snapshot.data!.technology ?? 'Unknown'}v',
                                        title: 'Technology',
                                        // icon: AppSvgs.technology,
                                        icon: AppSvgs.androidIcon,
                                      ),
                                      _verticalSpaceSmall,
                                      GridCardWidget(
                                        chargingStatus:
                                            '${snapshot.data!.pluggedStatus == "plugged" ? "AC" : "DC"}v',
                                        title: 'Charging Type',
                                        // icon: AppSvgs.plugIcon,
                                        icon: AppSvgs.androidIcon,
                                      ),
                                      _verticalSpaceSmall,
                                    ],
                                  ),
                                  SizedBox(width: 10.w),
                                  //*
                                  Column(
                                    children: [
                                      GridCardWidget(
                                        chargingStatus: '${batteryCapacity ~/1000} mAh',
                                        title: 'Battery Capacity',
                                        // icon: AppSvgs.capacityIcon,
                                        icon: AppSvgs.androidIcon,
                                      ),
                                      _verticalSpaceSmall,
                                      GridCardWidget(
                                        chargingStatus: snapshot.data!.health!
                                            .split('_')
                                            .last,
                                        title: 'Health',
                                        // icon: AppSvgs.healthIcon,
                                        icon: AppSvgs.androidIcon,
                                      ),
                                      _verticalSpaceSmall,
                                      GridCardWidget(
                                        chargingStatus:
                                            controller.deviceModel ?? 'Unkown',
                                        title: 'Model',
                                        // icon: AppSvgs.modelIcon,
                                        icon: AppSvgs.androidIcon,
                                      ),
                                      _verticalSpaceSmall,
                                      GridCardWidget(
                                        chargingStatus:
                                            controller.androidVersion ??
                                                'Unkown',
                                        title: 'Android Version',
                                        icon: AppSvgs.androidIcon,
                                      ),
                                      _verticalSpaceSmall,
                                      GridCardWidget(
                                        chargingStatus:
                                            controller.buildId ?? 'Unkown',
                                        title: 'Built Id',
                                        // icon: AppSvgs.builtIdIcon,
                                        icon: AppSvgs.androidIcon,
                                      ),
                                      _verticalSpaceSmall,
                                    ],
                                  ),
                                ],
                              ),
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

                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          );
        },
      );
}

//*GridView
Widget get _remainingTime => Column(
      children: [
        const RemainingTime(),
        Text(
          'Remaining',
          style: BTextTheme.lightTextTheme.bodyLarge,
        ),
      ],
    );
//*
get _gridDelegate => SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 15.w,
      mainAxisSpacing: 9.h,
      crossAxisCount: 2,
      childAspectRatio: 2.8,
    );
//*
BoxDecoration get _boxDecoration => BoxDecoration(
      color: AppColors.backgroundColor,
      boxShadow: [
        AppDecorations.smallWhiteBoxShadow,
        AppDecorations.smallboxShadow,
      ],
      borderRadius: BorderRadius.circular(10.r),
    );
Widget get _verticalSpace => SizedBox(height: 20.h);
Widget get _verticalSpaceSmall => SizedBox(height: 10.h);

// //*time
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
                    .copyWith(fontSize: 34),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Text('Hour', style: BTextTheme.lightTextTheme.bodyLarge),
              ),
              SizedBox(width: 8.h), // Adjust the spacing between Hour and Min
              Text(
                '${(snapshot.data!.chargeTimeRemaining! / 1000 / 60 % 60).truncate()}',
                style: BTextTheme.lightTextTheme.labelLarge!
                    .copyWith(fontSize: 34),
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










 // Container(
                    //   height: 350,
                    //   child: GridView.builder(
                    //     padding: EdgeInsets.symmetric(
                    //         horizontal: 5.w, vertical: 5.h),
                    //     gridDelegate: _gridDelegate,
                    //     itemCount: controller.batterInformationData.length,
                    //     itemBuilder: (context, int index) {
                    //       return Container(
                    //         padding: EdgeInsets.symmetric(
                    //             horizontal: 8.w, vertical: 10.h),
                    //         decoration: _boxDecoration,
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             SvgPicture.asset(
                    //               controller.batterInformationData[index].icon,
                    //             ),
                    //             _verticalSpace,
                    //             SingleChildScrollView(
                    //               child: Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 children: [
                    //                   Text(
                    //                     controller
                    //                         .batterInformationData[index].title,
                    //                     textAlign: TextAlign.left,
                    //                     overflow: TextOverflow.ellipsis,
                    //                     style: BTextTheme
                    //                         .lightTextTheme.labelLarge,
                    //                   ),
                    //                   SizedBox(
                    //                     width: 100.w,
                    //                     child: Text(
                    //                       controller
                    //                           .batterInformationData[index]
                    //                           .subTitle,
                    //                       textAlign: TextAlign.left,
                    //                       overflow: TextOverflow.ellipsis,
                    //                       maxLines: 1,
                    //                       style: BTextTheme
                    //                           .lightTextTheme.labelLarge!
                    //                           .copyWith(
                    //                               color:
                    //                                   AppColors.secondaryColor),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // const Expanded(child: BatteryInfoGrid()),