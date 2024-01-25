import '../../../battery_alert.dart';

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
          // TODO: a
          // BatteryInfoHandler.instance.startListening();
          ChargingHistoryController.instance.startListening();
          ChargingHistoryController.instance.getCharhistory();
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

                    //*Center
                    const BatteryInfoWidget(),

                    //*Bottom
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
                                    Get.to(() => const AlarmSettingsView()),
                                onChanged: (value) {
                                  controller.handleAlarmSetting(value: value);
                                },
                                value: controller.alarmSettingBoolValue,
                              ),

                              //* Charging Animation
                              SwitchSettingCard(
                                imgText: 'assets/images/icons/chargeIcon.svg',
                                title1: 'Charging \nAnimation',
                                onTap: () =>
                                    Get.to(() => const SelectAnimation()),
                                onChanged: (value) {
                                  controller.handleAnimationSwitch(
                                      value: value);
                                },
                                value: controller.animationBoolValue,
                              ),
                            ],
                          ),

                          //*AdsAndSmallContainers
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
                                    onTap: () => Get.to(
                                        () => const ChargingHistoryView()),
                                  ),
                                  SizedBox(height: 25.h),
                                  cardBox(
                                    text1: 'Battery \nInformation',
                                    image: AppSvgs.batteryIcon,
                                    onTap: () =>
                                        Get.to(() => const BatteryInfoView()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //*SmallContainers
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardBox(
                            text1: 'Battery \nusage ',
                            image: AppSvgs.batteryCellIcon,
                            onTap: () => Get.to(() => const BatteryUsageView()),
                          ),
                          SizedBox(height: 25.h),
                          cardBox(
                            text1: 'charger \ntesting',
                            image: AppSvgs.chargerIcon,
                            onTap: () =>
                                Get.to(() => const ChargerTestingView()),
                          ),
                        ],
                      ),
                    ),

                    //*AdsContainer
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                      child: Container(
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
