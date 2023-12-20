import '../../../battery_alert.dart';

class HistoryTimeWidget extends GetWidget {
  const HistoryTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xff0FD46D),
          boxShadow: [
            AppDecorations.chargerHistoryShadow,
          ]),
      child: Center(
        child: Container(
          height: 126.h,
          decoration: const BoxDecoration(
            color: Color(0xff190051),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              height: 110.h,
              decoration: const BoxDecoration(
                color: Color(0xff365774),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 100.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff1C005B),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 44.h,
                      width: 73,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '11%',
                            style:
                                BTextTheme.lightTextTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          Text(
                            'to',
                            style: BTextTheme.lightTextTheme.bodyMedium,
                          ),
                          Text(
                            '15%',
                            style:
                                BTextTheme.lightTextTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryColor,
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
    );
  }
}
