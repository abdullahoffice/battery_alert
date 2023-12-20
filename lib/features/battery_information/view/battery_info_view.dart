import '../../../battery_alert.dart';

class BatteryInfoView extends GetView<BatteryViewController> {
  const BatteryInfoView({super.key});

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
                  children: [
                    const NavigationHeader(title: 'Battery Information'),
                    Expanded(
                      ///TODO 1
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //*
                            SizedBox(height: 12.h),
                            const BatteryPogressWidget(),

                            //*
                            // SizedBox(height: 6.h),
                            const HourMinuteRow(),

                            //*
                            Text('Remaining',
                                style: BTextTheme.lightTextTheme.bodyLarge),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),

                    //*Grid
                    Expanded(
                      // flex: 2,
                      child: BatteryInfoGrid(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}

//*HourMinuteRow
class HourMinuteRow extends StatelessWidget {
  const HourMinuteRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '23',
          style:
              BTextTheme.lightTextTheme.labelLarge!.copyWith(fontSize: 34.sp),
        ),
        Text(
          'Hour',
          style: BTextTheme.lightTextTheme.headlineSmall!
              .copyWith(fontWeight: FontWeight.normal),
        ),
        Text(
          '6',
          style:
              BTextTheme.lightTextTheme.labelLarge!.copyWith(fontSize: 34.sp),
        ),
        Text(
          'Min',
          style: BTextTheme.lightTextTheme.headlineSmall!
              .copyWith(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
