import '../../../battery_alert.dart';

class SwitchSettingCard extends StatelessWidget {
  const SwitchSettingCard({
    super.key,
    required this.imgText,
    required this.title1,
    required this.onTap,
    required this.value,
    required this.onChanged,
  });
  final String imgText;
  final String title1;
  final VoidCallback onTap;
  final ValueChanged<bool> onChanged;
  final bool value; // Added variable to handle switch state

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      decoration: BoxDecoration(
        color: const Color(0xff1C005B),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          AppDecorations.smallboxShadow,
          AppDecorations.smallWhiteBoxShadow,
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title1,
                  style: BTextTheme.lightTextTheme.labelLarge,
                ),
                 SizedBox(height: 13.h),
                SvgPicture.asset(
                  imgText,
                  width: 5,
                  height: 50,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                child: SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                      inactiveTrackColor: AppColors.backgroundColor,
                      activeTrackColor: AppColors.greenColor,
                      activeThumbImage: const AssetImage(
                        AppImages.alarmOn,
                      ),
                      inactiveThumbImage: const AssetImage(
                        AppImages.alarmOff,
                      ),
                      onChanged: onChanged,
                      value: value,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 42.h),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 45.h,
                  width: 58.w,
                  decoration: const BoxDecoration(
                    color: Color(0xff5C4493),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: IconButton(
                    onPressed: onTap,
                    icon: SvgPicture.asset(
                      'assets/images/icons/IconArrow.svg',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
