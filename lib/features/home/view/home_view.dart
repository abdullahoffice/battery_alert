import 'package:battery_alert/features/alarm_setting/view/alarmsetting_screen.dart';

import '../../../battery_alert.dart';

AlarmSettingsController alarmsettingcontroller = AlarmSettingsController();
HomeController homeeController = HomeController();

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: const AppBarView(),
        ),
      ),
    );
  }

  Widget get _body => GetBuilder<HomeController>(
        initState: (state) {
          // state.initState();
          // controller.getAnimationValue();
          controller.loadAlarmSetting();
          controller.loadAnimationSetting();
          controller.handleService();
          homeeController.loadAlarmSetting();
          homeeController.handleService();
          alarmsettingcontroller.getFullBatteryAlarm();

          // ChargingHistoryController.instance.setChargHistory(history: history);
        },
        builder: (_) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              // padding: const EdgeInsets.all(16),
              decoration: AppDecorations.backgroundImageDecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //*HeaderText
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Text(
                        'Full Battery  Alarm',
                        style: BTextTheme.lightTextTheme.headlineLarge,
                      ),
                    ),

                    //* BatteryInfoCard
                    // const BatteryInfoWidget(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: StreamBuilder(
                        stream: BatteryInfoPlugin().androidBatteryInfoStream,
                        builder: (context, AsyncSnapshot<dynamic> snapshot) {
                          String? healthStatus =
                              snapshot.data?.health!.split('_').last;
                          // var data = snapshot.data!.chargingStatus.toString();
                          if (snapshot.hasData) {
                            return PowerConsumpCard(
                              statusText: AppScreenUtils.getChargingStatus(
                                  snapshot.data?.chargingStatus),
                              hourValue: snapshot.data!.batteryLevel == 100
                                  ? 'Full'
                                  : '${(snapshot.data!.chargeTimeRemaining! / 1000 / 60 / 60).truncate()}h ',
                              minValue: snapshot.data!.batteryLevel == 100
                                  ? ''
                                  : '${(snapshot.data!.chargeTimeRemaining! / 1000 / 60 % 60).truncate()}m',
                              healthStatus: "$healthStatus",
                              temperatureValue:
                                  '${(snapshot.data!.temperature!)} °C',
                              voltageValue:
                                  '${(snapshot.data?.voltage)! / 1000} mV',
                              capacityValue:
                                  '${int.parse((snapshot.data!.batteryCapacity! / 1000).toStringAsFixed(0))} mAh',
                              batteryPercentage:
                                  '${(snapshot.data?.batteryLevel)} %',
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),

                    //* Switch buttons
                    SizedBox(height: 20.h),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //* Alarm setting
                              SwitchSettingCard(
                                imgText: 'assets/images/icons/alarmIcon.svg',
                                title1: 'Alarm \nsetting',
                                onTap: () =>
                                    // Get.to(() => const AlarmSettingsView()),
                                    // Get.toNamed(RouteName.alarmSettingScreen),
                                    Get.to(const AlarmSettingsScreen()),
                                onChanged: (value) {
                                  controller.handleAlarmSetting(value: value);
                                  controller.loadAlarmSetting();
                                  controller.handleService();
                                  alarmsettingcontroller.setFullBatteryAlarm(
                                      value: value);
                                },
                                value: controller.alarmSettingBoolValue,
                              ),

                              //* Charging Animation
                              SwitchSettingCard(
                                imgText: 'assets/images/icons/chargeIcon.svg',
                                title1: 'Charging \nAnimation',
                                onTap: () async {
                                  Get.toNamed(RouteName.selectAnimationScreen);
                                },
                                onChanged: (value) async {
                                  final status = await FlutterOverlayWindow
                                      .isPermissionGranted();
                                  if (status) {
                                    controller.handleAnimationSetting(
                                      value: value,
                                    );
                                    controller.loadAnimationSetting();
                                    controller.handleService();
                                  } else {
                                    // Request permission
                                    final bool? res = await FlutterOverlayWindow
                                        .requestPermission();
                                    if (res != null && res) {
                                      controller.handleAnimationSetting(
                                        value: value,
                                      );
                                      controller.loadAnimationSetting();
                                      controller.handleService();
                                    } else {
                                      debugPrint('Permission Denied');
                                    }
                                  }
                                },
                                value: controller.animationBoolValue,
                              ),
                            ],
                          ),

                          //* AdsAndSmallContainers
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              adsBoxWidget(height: 160.h),
                              Column(
                                children: [
                                  cardBox(
                                    text1: 'Charging \nHistory',
                                    image: AppSvgs.batteryIcon,
                                    // onTap: () => Get.to(
                                    //     () => const ChargingHistoryView()),
                                    onTap: () => Get.toNamed(
                                        RouteName.chargingHistoryScreen),
                                  ),
                                  SizedBox(height: 25.h),
                                  cardBox(
                                    text1: 'Battery \nInformation',
                                    image: AppSvgs.batteryIcon,
                                    // onTap: () =>
                                    // Get.to(() => const BatteryInfoView()),
                                    onTap: () => Get.toNamed(
                                        RouteName.batteryInformationScreen),
                                    // onTap: () =>
                                    //     Get.to(() => const BatteryInfoGridView()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //*SmallContainersCards
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardBox(
                            text1: 'Battery \nusage ',
                            image: AppSvgs.batteryCellIcon,
                            // onTap: () => Get.to(() => const BatteryUsageView()),
                            onTap: () =>
                                Get.toNamed(RouteName.batteryUsageScreen),
                            // Get.toNamed(RouteName.chargingAnimationScreen),
                          ),
                          SizedBox(height: 25.h),
                          cardBox(
                            text1: 'charger \ntesting',
                            image: AppSvgs.chargerIcon,
                            // onTap: () =>
                            //     Get.to(() => const ChargerTestingView()),
                            onTap: () =>
                                Get.toNamed(RouteName.chargerTestingScreen),
                          ),
                        ],
                      ),
                    ),

                    //*AdsContainer
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                      child: SizedBox(
                        width: double.infinity,
                        child: adsBoxWidget(height: 80.h),
                      ),
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
