import '../../../battery_alert.dart';

class ChargingHistoryView extends GetView<ChargingHistoryController> {
  const ChargingHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomIconButton(
                iconPath: AppSvgs.backArrow,
                onPress: () {
                  Get.back();
                },
              ),
            ),
            backgroundColor: AppColors.backgroundColor,
            title: Row(
              children: [
                Text(
                  'Charging History',
                  style: BTextTheme.lightTextTheme.titleSmall,
                ),
                const Spacer(),
                GestureDetector(
                  onTap:
                      ChargingHistoryController.instance.clearChargingHistory,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.clearButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Center(
                        child: Text(
                          'Clear',
                          style: BTextTheme.lightTextTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      ChargeHistoryContainer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
}
