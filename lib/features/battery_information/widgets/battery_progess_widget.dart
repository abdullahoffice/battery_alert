import 'package:battery_alert/battery_alert.dart';

class BatteryPogressWidget extends GetWidget {
  // final BoxShadow? boxShadows;
  const BatteryPogressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xff0FD46D),
        // boxShadow: boxShadows != null ? [boxShadows!] : [],
        boxShadow: [
          AppDecorations.batteryProgressShadow,
        ],
      ),
      child: Center(
        child: Container(
          height: 203.h,
          decoration: const BoxDecoration(
            color: Color(0xff190051),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              height: 175.h,
              decoration: const BoxDecoration(
                color: Color(0xff0FD46D),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 155.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff1C005B),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 110.h,
                      width: 73.w,
                      child: LiquidLinearProgressIndicator(
                        value: 0.5, // Defaults to 0.5.
                        valueColor: const AlwaysStoppedAnimation(
                          Color(0xff0FD46D),
                        ), // Defaults to the current Theme's accentColor.
                        backgroundColor: Colors
                            .white, // Defaults to the current Theme's backgroundColor.
                        borderColor: Color(0xff0FD46D),
                        borderWidth: 1.0,
                        borderRadius: 10.0,

                        direction: Axis
                            .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                        center: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '40',
                                style: BTextTheme.darkTextTheme.headlineMedium!
                                    .copyWith(
                                  color: AppColors.backgroundColor,
                                ),
                              ),
                              TextSpan(
                                text: '%',
                                style: BTextTheme.darkTextTheme.bodySmall!
                                    .copyWith(
                                  color: AppColors.backgroundColor,
                                ),
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
    );
  }
}
