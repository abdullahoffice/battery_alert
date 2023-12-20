import '../../../battery_alert.dart';

class BatteryFullAlarmWidget extends GetWidget<AlarmSettingsController> {
  const BatteryFullAlarmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff280C68),
        boxShadow: [AppDecorations.alarmSettingShadow],
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //*
                Text(
                  'Full Battery Alarm',
                  style: BTextTheme.lightTextTheme.bodyMedium,
                ),

                //*SwitchButton
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 35.h,
                    child: FittedBox(
                      child: Switch(
                        value: true,
                        activeTrackColor: const Color(
                          0xff120137,
                        ), // Set background color
                        onChanged: (value) => (),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //*textWithContainer
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            decoration: BoxDecoration(
                color: const Color(0xff190051),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              'Alarm Ring at',
              style: BTextTheme.lightTextTheme.labelLarge,
            ),
          ),

          //*ContainerFullBatteryALarm
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
                color: const Color(0xff190051),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Expanded(
                  child: SliderTheme(
                    data:  SliderThemeData(
                      trackHeight: 5.h,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 9.h,
                      ),
                    ),
                    child: Slider(
                      value: controller.currentSliderValue,
                      activeColor: const Color(0xff280C68),
                      secondaryTrackValue: 80,
                      max: 100,
                      onChanged: (double value) => controller.swithFunc(value),
                    ),
                  ),
                ),
                const Text('80%'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
