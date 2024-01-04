import '../../../battery_alert.dart';

class BatteryInfoView extends StatefulWidget {
  const BatteryInfoView({Key? key}) : super(key: key);

  @override
  _BatteryInfoViewState createState() => _BatteryInfoViewState();
}

class _BatteryInfoViewState extends State<BatteryInfoView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
      ),
    );
  }

  Widget get _body => GetBuilder<BatteryViewController>(
        builder: (_) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              decoration: AppDecorations.backgroundImageDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NavigationHeader(title: 'Battery Information'),

                    //*
                    // const SizedBox(height: 20),
                    const BatteryProgressWidget(),

                    //*
                    // const SizedBox(height: 20),
                    Column(
                      children: [
                        const RemainingTime(),
                        Text(
                          'Remaining',
                          style: BTextTheme.lightTextTheme.bodyLarge,
                        ),
                      ],
                    ),

                    //*
                    SizedBox(height: 4.h),

                    //*Grid
                    SizedBox(height: 4.h),
                    SizedBox(
                      height: 370.h,
                      child: const BatteryInfoGrid(),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          );
        },
      );
}

class RemainingTime extends StatelessWidget {
  const RemainingTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AndroidBatteryInfo?>(
      future: BatteryInfoPlugin().androidBatteryInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${(snapshot.data!.chargeTimeRemaining! / 1000 / 60 / 60).truncate()}',
                style: BTextTheme.lightTextTheme.labelLarge!
                    .copyWith(fontSize: 34.sp),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Text('Hour', style: BTextTheme.lightTextTheme.bodyLarge),
              ),
              SizedBox(width: 8.h), // Adjust the spacing between Hour and Min
              Text(
                '${(snapshot.data!.chargeTimeRemaining! / 1000 / 60 % 60).truncate()}',
                style: BTextTheme.lightTextTheme.labelLarge!
                    .copyWith(fontSize: 34.sp),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text('Min', style: BTextTheme.lightTextTheme.bodyLarge),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
