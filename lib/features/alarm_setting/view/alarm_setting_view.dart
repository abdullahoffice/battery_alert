import '../../../battery_alert.dart';

class AlarmSettingsView extends GetView<AlarmSettingsController> {
  const AlarmSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
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
                      const NavigationHeader(title: 'Alarm Setting'),
                      SizedBox(height: 20.h),
                      //*
                      const BatteryFullAlarmWidget(),
                      SizedBox(height: 20.h),
                      const BatteryFullAlarmWidget(),

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
