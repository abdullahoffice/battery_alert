import '../../../battery_alert.dart';

class BatteryUsageView extends GetView<BatteryUsageController> {
  const BatteryUsageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: _body,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            //*image
            // flexibleSpace: const Image(
            //   image: AssetImage(AppImages.backgroudImageLight),
            //   fit: BoxFit.cover,
            // ),
            backgroundColor: AppColors.backgroundColor,
            // backgroundColor: AppColors.secondaryColor,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomIconButton(
                iconPath: AppSvgs.backArrow,
                onPress: () {
                  Get.back();
                },
              ),
            ),
            title: Text(
              'Battery Usage',
              style: BTextTheme.lightTextTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }

  Widget get _body => GetBuilder<BatteryUsageController>(initState: (_) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            // controller.getDailyUsageStats();
            controller.getWeeklyUsageStats();
            controller.getDailyUsageStats();
          },
        );
      }, builder: (_) {
        return Container(
          decoration: AppDecorations.backgroundImageDecoration,
          child: Column(
            children: [
              SizedBox(height: 10.h),
              TabBar(
                dividerColor: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.black,
                labelStyle: BTextTheme.darkTextTheme.bodySmall,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: AppColors.lightGreenColor),
                tabs: const [
                  Tab(
                    child: Text('Daily'),
                  ),
                  Tab(
                    child: Text('Weekly'),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    DailyBatteryUsage(controller: controller),
                    WeeklyBatteryUsage(controller: controller),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
