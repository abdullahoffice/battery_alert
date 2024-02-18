import '../../../battery_alert.dart';

class ChargerTestingView extends GetView<ChargerTestingController> {
  const ChargerTestingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomIconButton(
              iconPath: AppSvgs.backArrow,
              onPress: () {
                Get.back();
              },
            ),
          ),
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            'Charger testing',
            style: BTextTheme.lightTextTheme.titleSmall,
          ),
        ),
      ),
    );
  }

  Widget get _body => GetBuilder<ChargerTestingController>(builder: (context) {
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
                  SizedBox(height: screenHeight * 0.02),
                  // _batteryInfo(),
                  // BatteryProgress(),
                  StreamBuilder<AndroidBatteryInfo?>(
                    stream: GlobalController
                        .instance.batteryInfoPlugin.androidBatteryInfoStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        debugPrint('Battery Info: ${snapshot.data}');
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomContainer(
                                  valueText: 'Min Value',
                                  value: '${controller.calculateMinCurrent(
                                    snapshot.data?.currentNow!.toDouble(),
                                    snapshot.data?.currentAverage!.toDouble(),
                                  )} mA',
                                ),
                                CustomContainer(
                                  valueText: 'Current',
                                  value:
                                      '${(snapshot.data?.currentNow)! / 1000} mAh',
                                ),
                                CustomContainer(
                                  valueText: 'Max Value',
                                  value:
                                      '${(snapshot.data?.voltage)! / 1000} V',
                                ),
                              ],
                            ),
                            //*CircularBattery
                            SizedBox(height: 40.h),
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
                                                      MainAxisAlignment.center,
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

                            SizedBox(height: 40.h),
                            Text(
                              controller.isTimerRunning
                                  ? 'Charger Status: ${AppScreenUtils.getChargingStatus(snapshot.data?.chargingStatus)}'
                                  : 'Charger quality: ${controller.calculateChargerStatus() ?? 'N/A'}',
                              style: BTextTheme.lightTextTheme.bodyMedium,
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
                  //*
                  SizedBox(height: 25.h),
                  const TimerButton(),
                  //*
                  SizedBox(height: 34.h),
                  _nativeAdsWidget,
                ],
              ),
            ),
          ),
        );
      });

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
                fontSize: 32,
              ),
            ),
          ),
        ),
      );
}










// class ChargerTestingView extends GetView<ChargerTestingController> {
//   const ChargerTestingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: _body,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           leading: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomIconButton(
//               iconPath: AppSvgs.backArrow,
//               onPress: () {
//                 Get.back();
//               },
//             ),
//           ),
//           backgroundColor: AppColors.backgroundColor,
//           title: Text(
//             'Charger testing',
//             style: BTextTheme.lightTextTheme.titleSmall,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget get _body => GetBuilder<ChargerTestingController>(
//         builder: (context) {
//           return SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//               decoration: AppDecorations.backgroundImageDecoration,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     _batteryInfo(controller.batterySnapshot.value),
//                     _circularBattery(controller.batterySnapshot.value),
//                     _chargerStatus(controller.isTimerRunning,
//                         controller.batterySnapshot.value),
//                     SizedBox(height: 25.h),
//                     const TimerButton(),
//                     SizedBox(height: 34.h),
//                     _nativeAdsWidget,
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );

//   Widget _batteryInfo(AndroidBatteryInfo? snapshot) {
//     if (snapshot != null) {
//       return Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CustomContainer(
//                 valueText: 'Min Value',
//                 value:
//                     '${controller.calculateMinCurrent(snapshot.currentNow!.toDouble(), snapshot.currentAverage!.toDouble())} mA',
//               ),
//               CustomContainer(
//                 valueText: 'Current',
//                 value: '${snapshot.currentNow! / 1000} mAh',
//               ),
//               CustomContainer(
//                 valueText: 'Max Value',
//                 value: '${snapshot.voltage! / 1000} V',
//               ),
//             ],
//           ),
//         ],
//       );
//     } else {
//       return CircularProgressIndicator(
//         color: AppColors.greenColor,
//       );
//     }
//   }

//   Widget _circularBattery(AndroidBatteryInfo? snapshot) {
//     if (snapshot != null) {
//       return Container(
//         height: 210.h,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: const Color(0xff0FD46D),
//           boxShadow: [AppDecorations.batteryProgressShadow],
//         ),
//         child: Center(
//           child: Container(
//             height: 203.h,
//             decoration: const BoxDecoration(
//               color: Color(0xff190051),
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: Container(
//                 height: 175.h,
//                 decoration: const BoxDecoration(
//                   color: Color(0xff0FD46D),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Center(
//                   child: Container(
//                     height: 155.h,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color(0xff1C005B),
//                     ),
//                     child: Center(
//                       child: SizedBox(
//                         height: 110.h,
//                         width: 73.w,
//                         child: LiquidLinearProgressIndicator(
//                           value:
//                               double.parse('${snapshot.batteryLevel! / 100}'),
//                           valueColor: const AlwaysStoppedAnimation(
//                             Color(0xff0FD46D),
//                           ),
//                           backgroundColor: Colors.white,
//                           borderColor: const Color(0xff0FD46D),
//                           borderWidth: 1.0,
//                           borderRadius: 10.0,
//                           direction: Axis.vertical,
//                           center: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Text(
//                                 '${snapshot.batteryLevel!.toInt()}',
//                                 style: BTextTheme.lightTextTheme.headlineSmall
//                                     ?.copyWith(
//                                   color: AppColors.backgroundColor,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 1.h),
//                                 child: Text(
//                                   '%',
//                                   style: BTextTheme.lightTextTheme.bodyLarge!
//                                       .copyWith(
//                                     color: AppColors.backgroundColor,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     } else {
//       return const SizedBox(); // Return empty SizedBox if snapshot is null
//     }
//   }

//   Widget _chargerStatus(bool isTimerRunning, AndroidBatteryInfo? snapshot) {
//     if (isTimerRunning) {
//       return Text(
//         'Charger Status: ${AppScreenUtils.getChargingStatus(snapshot?.chargingStatus)}',
//         style: BTextTheme.lightTextTheme.bodyMedium,
//       );
//     } else {
//       return Text(
//         'Charger quality: ${controller.calculateChargerStatus() ?? 'N/A'}',
//         style: BTextTheme.lightTextTheme.bodyMedium,
//       );
//     }
//   }

//   Widget get _nativeAdsWidget => GestureDetector(
//         child: Container(
//           width: 210.w,
//           height: 160.h,
//           decoration: BoxDecoration(
//               color: Colors.yellow, borderRadius: BorderRadius.circular(10.r)),
//           child: Center(
//             child: Text(
//               'Native \nADS',
//               textAlign: TextAlign.center,
//               style: BTextTheme.lightTextTheme.headlineLarge!.copyWith(
//                 fontWeight: FontWeight.normal,
//                 fontSize: 32,
//               ),
//             ),
//           ),
//         ),
//       );
// }