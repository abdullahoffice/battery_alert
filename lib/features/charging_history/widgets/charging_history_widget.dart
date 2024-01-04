import '../../../battery_alert.dart';

class ChargingHistoryItemWidget extends StatelessWidget {
  final String chargedFor;
  final String percentTitle;
  final String plugIn;
  final String time;
  final String date;
  final String plugOut;
  final String time2;
  final String date2;
  final String startPercentage;
  final String endPercentage;

  const ChargingHistoryItemWidget({
    super.key,
    required this.chargedFor,
    required this.percentTitle,
    required this.plugIn,
    required this.time,
    required this.date,
    required this.plugOut,
    required this.time2,
    required this.date2,
    required this.startPercentage,
    required this.endPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 12.w,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff1C005B),
        boxShadow: [
          AppDecorations.boxShadow,
          AppDecorations.whiteBoxShadow,
        ],
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(chargedFor),
              Text(percentTitle),
            ],
          ),
          SizedBox(height: 10.h),
          HistoryTimeWidget(
            startPercentage: startPercentage,
            endPercentage: endPercentage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    plugIn,
                    style: BTextTheme.lightTextTheme.bodyLarge!,
                  ),
                  Row(
                    children: [
                      Text(
                        '$time | ',
                        style: BTextTheme.lightTextTheme.labelLarge!,
                      ),
                      Text(
                        date,
                        style: BTextTheme.lightTextTheme.labelLarge!,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    plugOut,
                    style: BTextTheme.lightTextTheme.bodyLarge!,
                  ),
                  Row(
                    children: [
                      Text(
                        '$time2 | ',
                        style: BTextTheme.lightTextTheme.labelLarge!,
                      ),
                      Text(
                        date2,
                        style: BTextTheme.lightTextTheme.labelLarge!,
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
