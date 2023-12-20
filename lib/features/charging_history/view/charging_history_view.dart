import 'package:battery_alert/battery_alert.dart';

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
                      _chargeHistoryContainer,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  Widget get _chargeHistoryContainer => Column(
        children: [
          ...List.generate(
            controller.chargingHistoryData.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
              child: Column(
                children: [
                  Container(
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
                            Text(
                              controller.chargingHistoryData[index].title,
                            ),
                            Text(
                              controller
                                  .chargingHistoryData[index].percentTitle,
                            ),
                          ],
                        ),
                        //*Centered
                        SizedBox(height: 10.h),
                        const HistoryTimeWidget(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  controller.chargingHistoryData[index].plugIn,
                                  style: BTextTheme.lightTextTheme.bodyLarge!,
                                ),
                                Row(
                                  children: [
                                    Text(
                                        '${controller.chargingHistoryData[index].time} | ',
                                        style: BTextTheme
                                            .lightTextTheme.labelLarge!),
                                    Text(
                                      controller
                                          .chargingHistoryData[index].date,
                                      style:
                                          BTextTheme.lightTextTheme.labelLarge!,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    controller
                                        .chargingHistoryData[index].plugOut,
                                    style:
                                        BTextTheme.lightTextTheme.bodyLarge!),
                                Row(
                                  children: [
                                    Text(
                                        '${controller.chargingHistoryData[index].time} | ',
                                        style: BTextTheme
                                            .lightTextTheme.labelLarge!),
                                    Text(
                                      controller
                                          .chargingHistoryData[index].date,
                                      style:
                                          BTextTheme.lightTextTheme.labelLarge!,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ],
      );
}
