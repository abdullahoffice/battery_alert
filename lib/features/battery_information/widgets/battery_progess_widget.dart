import '../../../battery_alert.dart';

class BatteryProgressWidget extends StatefulWidget {
  const BatteryProgressWidget({Key? key}) : super(key: key);

  @override
  _BatteryProgressWidgetState createState() => _BatteryProgressWidgetState();
}

class _BatteryProgressWidgetState extends State<BatteryProgressWidget> {
  late Stream<AndroidBatteryInfo?> batteryInfoStream;
//TODO: init
  // @override
  // void initState() {
  //   super.initState();
  //   initializeBatteryInfoStream();
  // }

  // void initializeBatteryInfoStream() {
  //   batteryInfoStream = BatteryInfoPlugin().androidBatteryInfoStream;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xff0FD46D),
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
                      child: StreamBuilder(
                          stream: BatteryInfoPlugin().androidBatteryInfoStream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return LiquidLinearProgressIndicator(
                                value: double.parse(
                                    '${snapshot.data!.batteryLevel! / 100}'),
                                valueColor: const AlwaysStoppedAnimation(
                                  Color(0xff0FD46D),
                                ),
                                backgroundColor: Colors.white,
                                borderColor: const Color(0xff0FD46D),
                                borderWidth: 1.0,
                                borderRadius: 10.0,
                                direction: Axis.vertical,
                                center: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      snapshot.data!.batteryLevel.toString(),
                                      style: BTextTheme
                                          .lightTextTheme.headlineSmall
                                          ?.copyWith(
                                        color: AppColors.backgroundColor,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      child: Text(
                                        '%',
                                        style: BTextTheme
                                            .lightTextTheme.bodyLarge!
                                            .copyWith(
                                          color: AppColors.backgroundColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
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
