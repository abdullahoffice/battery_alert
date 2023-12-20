import '../../../battery_alert.dart';

Widget  circularBatteryIndicator({required String batteryPercentage}) {
  return Expanded(
    child: DottedBorder(
      color: Colors.grey.withOpacity(0.2),
      dashPattern: const [6, 8],
      strokeWidth: 2,
      borderType: BorderType.Circle,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      borderPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: DottedBorder(
        color: Colors.grey,
        dashPattern: const [6, 8],
        strokeWidth: 2,
        borderType: BorderType.Circle,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),  
        borderPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: Center(
          child: Container(
            height: 180.h,
            decoration: const BoxDecoration(
               shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xff1F0F86),
                  Color(0xff279E49),
                ],
              ),
            ),
            child: Center(
              child: Container(
                height: 140.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff279B4A),
                      Color(0xff34128F),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    height: 135.h,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff279B4A),
                          Color(0xff311AC2),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        height: 110.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff1C005B),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/icons/powerIcon.svg',height: 10.h,width: 8.w,),
                              Text(
                               batteryPercentage,
                                style: BTextTheme.lightTextTheme.headlineMedium,
                              ),
                              Text(
                                'BATTERY',
                                style: BTextTheme.lightTextTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
