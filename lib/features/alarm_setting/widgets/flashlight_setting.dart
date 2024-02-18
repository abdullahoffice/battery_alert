import '../../../battery_alert.dart';

class FlashLightSetting extends GetWidget<AlarmSettingsController> {
  const FlashLightSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlarmSettingsController>(builder: (_) {
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
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 40.w,
                              height: 35.h,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Switch(
                                  inactiveTrackColor: AppColors.backgroundColor,
                                  onChanged: (value) =>
                                      controller.handleFlashlight(value: value),
                                  value: controller.flashLight,
                                ),
                              ),
                            ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Flash Speed',
                                style: BTextTheme.lightTextTheme.bodyLarge,
                              ),
                              //*SwitchButton
                            ],
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
                                      value: 1,
                                      min: 0.1,
                                      max: 2.0,
                                      divisions: 20,
                                      onChanged: (value) => {},
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
    });
  }
}
