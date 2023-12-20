import 'package:battery_alert/battery_alert.dart';

class BatteryUsageView extends GetView<BatteryUsageController> {
  const BatteryUsageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
      ),
    );
  }

  Widget get _body => GetBuilder<BatteryUsageController>(
        initState: (_) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            controller.getUsageStats();
          });
        },
        builder: (_) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              decoration: AppDecorations.backgroundImageDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                child: Column(
                  children: [
                    const NavigationHeader(title: 'Battery Usage'),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => controller.setCurrentTab(c: 0),
                          child: Container(
                            width: 129.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: controller.currentTab == 0
                                  ? AppColors.secondaryColor
                                  : const Color(0xff280C68),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Daily',
                                style: TextStyle(
                                  color: controller.currentTab == 0
                                      ? const Color(0xff280C68)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.setCurrentTab(c: 1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: controller.currentTab == 0
                                  ? const Color(0xff280C68)
                                  : AppColors.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            width: 129.w,
                            height: 28.h,
                            child: const Center(child: Text('Weekly')),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: controller.listWidgets[controller.currentTab],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
