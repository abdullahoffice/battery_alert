import '../../../battery_alert.dart';

class RingtoneSetting extends GetWidget<AlarmSettingsController> {
  const RingtoneSetting({super.key});

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            AppSvgs.smallAlarmIcon,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Ringtone',
                            style: BTextTheme.lightTextTheme.bodyLarge,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 110.w,
                            child: TextButton(
                              onPressed: controller.pickRingtone,
                              child: Text(
                                controller.selectedRingtone != null
                                    ? controller.selectedRingtoneName!
                                    : 'Select Ringtone >',
                                overflow: TextOverflow.ellipsis,
                                style: BTextTheme.lightTextTheme.bodyLarge,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (controller.isPlaying) {
                                controller.stopRingtone();
                              } else {
                                controller.playRingtone();
                              }
                            },
                            child: Icon(
                              controller.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
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
                          SvgPicture.asset(AppSvgs.smallvolumeIcon),
                          SizedBox(width: 10.w),
                          Text(
                            'Volume',
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
                                      value: controller.volume.value,
                                      activeColor: const Color(0xff280C68),
                                      secondaryTrackValue: 70,
                                      min: 0,
                                      max: 100,
                                      onChanged: (double value) =>
                                          controller.setVolume(value),
                                    ),
                                  ),
                                ),
                              ],
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Vibration',
                              style: BTextTheme.lightTextTheme.bodyLarge,
                            ),
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
