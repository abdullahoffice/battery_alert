import '../../../battery_alert.dart';

Widget switchSettingCard({
  required String imgText,
  required String title1,
  required VoidCallback onTap,
  // required bool isOn,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 130.h,
        width: 150.w,
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xff1C005B),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              AppDecorations.smallboxShadow,
              AppDecorations.smallWhiteBoxShadow,
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //*
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title1,
                    style: BTextTheme.lightTextTheme.labelLarge,
                  ),
                  SvgPicture.asset(
                    imgText,
                    width: 5,
                    height: 50,
                  ),
                ],
              ),
            ),
            // const SizedBox(width: 40,),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterSwitch(
                    activeColor: AppColors.swichButtonColor,
                    inactiveColor: AppColors.swichButtonColor,
                    width: 40.0,
                    height: 20.0,
                    valueFontSize: 25.0,
                    toggleSize: 25.0,
                    value: false,
                    borderRadius: 20.0,
                    padding: 1.0,
                    showOnOff: false,
                    activeToggleColor: Colors.red,
                    inactiveToggleColor: Colors.red,
                    activeIcon: const Icon(
                      Icons.alarm,
                      color: AppColors.primaryColor,
                    ),
                    inactiveIcon: const Icon(
                      Icons.alarm_off,
                      color: AppColors.primaryColor,
                    ),
                    onToggle: (val) {
                      //   status = val;
                    },
                  ),
                ),
                // Spacer(),
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
                            bottomRight: Radius.circular(20))),
                    child: IconButton(
                      onPressed: () {},
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
      ),
    );
