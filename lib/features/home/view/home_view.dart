import '../../../battery_alert.dart';
import 'dart:core';

class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
      ),
    );
  }

  Widget get _body => GetBuilder<HomeController>(
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
                    //*TopNavigationBar
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: const AppBarView(),
                    ),

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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: StreamBuilder<AndroidBatteryInfo?>(
                        stream: BatteryInfoPlugin().androidBatteryInfoStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return PowerConsumpCard(
                              // ${(snapshot.data?.batteryLevel)} %"
                              statusText: '${(snapshot.data?.batteryLevel)} %',
                              hourValue: 'ss',
                              powerConsumptionValue: 'ss',
                              healthStatus: 'sno',
                              temperatureValue: '30.4 C ',
                              voltageValue: '4.223 V',
                              capacityValue: '${(snapshot.data?.batteryCapacity)}',
                              batteryPercentage: '${(snapshot.data?.batteryLevel)} %',
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),

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
                              
                              //*SwitchContainers
                              switchSettingCard(
                                imgText: 'assets/images/icons/alarmIcon.svg',
                                title1: 'Alarm \nsetting',
                                onTap: () => Get.to(const AlarmSettingsView()),
                              ),
                              switchSettingCard(
                                imgText: 'assets/images/icons/chargeIcon.svg',
                                title1: 'Charging \nAnimation',
                                onTap: () =>
                                    Get.to(const ChargingAnimationView()),
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
                                    onTap: () =>
                                        Get.to(const ChargingHistoryView()),
                                  ),
                                  SizedBox(height: 25.h),
                                  cardBox(
                                    text1: 'Battery \nInformation',
                                    image: AppSvgs.batteryIcon,
                                    onTap: () =>
                                        Get.to(const BatteryInfoView()),
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
                            onTap: () => Get.to(const BatteryUsageView()),
                          ),
                          SizedBox(height: 25.h),
                          cardBox(
                            text1: 'charger \ntesting',
                            image: AppSvgs.chargerIcon,
                            onTap: () => Get.to(const ChargerTestingView()),
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
