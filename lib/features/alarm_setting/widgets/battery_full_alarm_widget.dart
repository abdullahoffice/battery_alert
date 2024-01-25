import '../../../battery_alert.dart';

class BatteryFullAlarmWidget extends StatelessWidget {
//   const BatteryFullAlarmWidget1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// class BatteryFullAlarmWidget extends GetWidget<AlarmSettingsController> {
  final String text;
  final ValueChanged<bool> onChanged;
  final bool value;
  final String sliderText;
  final ValueChanged<double> onSliderChanged;
  final double sliderValue;
  const BatteryFullAlarmWidget({
    required this.sliderText,
    required this.onSliderChanged,
    required this.sliderValue,
    required this.onChanged,
    required this.value,
    required this.text,
    super.key,
  });

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
                  text,
                  style: BTextTheme.lightTextTheme.bodyMedium,
                ),
    
                //*SwitchButton
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 40.w,
                    height: 35.h,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                        inactiveTrackColor: AppColors.backgroundColor,
                        onChanged: onChanged,
                        value: value,
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
                    data: SliderThemeData(
                      trackHeight: 5.h,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 9.h,
                      ),
                    ),
                    child: Slider(
                      value: sliderValue,
                      activeColor: const Color(0xff280C68),
                      secondaryTrackValue: 80,
                      max: 100,
                      onChanged: onSliderChanged,
                    ),
                  ),
                ),
                Text(sliderText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
