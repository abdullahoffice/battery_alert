import '../../../battery_alert.dart';

class ChargingHistoryView extends GetView<ChargingHistoryController> {
  const ChargingHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
      ),
    );
  }

  Widget get _body => GetBuilder<ChargingHistoryController>(
        builder: (_) {
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              decoration: AppDecorations.backgroundImageDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const NavigationHeader(title: 'Battery Information'),
                      SizedBox(height: 30.h),
                      const ChargeHistoryContainer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
}

