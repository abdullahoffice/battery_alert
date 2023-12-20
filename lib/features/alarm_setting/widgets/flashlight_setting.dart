import '../../../battery_alert.dart';

class FlashLightSetting extends GetWidget<AlarmSettingsController> {
  const FlashLightSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        color: const Color(0xff280C68),
        boxShadow: [AppDecorations.alarmSettingShadow],
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 25.w),
              Text(
                'Vibration',
                style: BTextTheme.lightTextTheme.bodyLarge,
              ),
              const Spacer(),

              //*switch
              SizedBox(
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
            ],
          ),

          //*line
          Container(
            height: 0.8.h,
            color: Colors.grey.withOpacity(0.4),
            width: 120.w,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 25.w),
                        Text(
                          'Flashlight',
                          style: BTextTheme.lightTextTheme.bodyLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 0.8.h,
                      color: Colors.grey.withOpacity(0.4),
                      width: 120.w,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SvgPicture.asset(AppSvgs.smallvolumeIcon),
                        SizedBox(width: 25.w),
                        Text(
                          'Flash Speed',
                          style: BTextTheme.lightTextTheme.bodyLarge,
                        ),
                        const Spacer(),
                        Container(
                          width: 150.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              color: const Color(0xff190051),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    trackHeight: 3.h,
                                    thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 7.r,
                                    ),
                                  ),
                                  child: Slider(
                                    value: controller.currentSliderValue,
                                    activeColor: const Color(0xff280C68),
                                    secondaryTrackValue: 80,
                                    max: 100,
                                    onChanged: (double value) =>
                                        controller.swithFunc(value),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
