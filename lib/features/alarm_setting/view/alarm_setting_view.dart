import '../../../battery_alert.dart';

class AlarmSettingsView extends GetView<AlarmSettingsController> {
  const AlarmSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: const CustomAppBar(title: 'Alarm Setting'),
        ),
      ),
    );
  }

  Widget get _body => GetBuilder<AlarmSettingsController>(
        builder: (_) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Container(
                decoration: AppDecorations.backgroundImageDecoration,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
                  child: Column(
                    children: [
                      // //* Full Battery Alarm
                      BatteryFullAlarmWidget(
                        text: 'Full Battery Alarm',
                        onChanged: (value) =>
                            controller.handleFullBatteryAlarm(value: value),
                        value: controller.fullBatteryAlarm,
                        sliderText: '80%',
                        onSliderChanged: (double value) =>
                            controller.swithFunc(value),
                        sliderValue: 20,
                      ),

                      // //*Low Battery Alarm
                      SizedBox(height: 20.h),
                      BatteryFullAlarmWidget(
                        text: 'Full Battery Alarm',
                        onChanged: (value) =>
                            controller.handleLowBatteryAlarm(value: value),
                        value: controller.lowBatteryAlarm,
                        sliderText: '80%',
                        onSliderChanged: (double value) =>
                            controller.swithFunc(value),
                        sliderValue: 20,
                      ),
                      //*
                      SizedBox(height: 20.h),
                      const RingtoneSetting(),
                      SizedBox(height: 20.h),
                      const FlashLightSetting(),
                      SizedBox(height: 20.h),
                      const AdsWidget(),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
  
}
