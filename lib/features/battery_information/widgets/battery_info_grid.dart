import '../../../battery_alert.dart';

class BatteryInfoGrid extends StatefulWidget {
  const BatteryInfoGrid({super.key});

  @override
  State<BatteryInfoGrid> createState() => _BatteryInfoGridState();
}

class _BatteryInfoGridState extends State<BatteryInfoGrid> {
  late BatteryViewController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<BatteryViewController>();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AndroidBatteryInfo?>(
        stream: BatteryInfoPlugin().androidBatteryInfoStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller.updateBatteryInformation(snapshot.data!);

            return GridView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 9.h,
                crossAxisCount: 2,
                childAspectRatio: 2.8,
              ),
              itemCount: controller.batterInformationData.length,
              itemBuilder: (context, int index) {
                return Container(
                  // width: 140.w,
                  // height: 62.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    boxShadow: [
                      AppDecorations.smallWhiteBoxShadow,
                      AppDecorations.smallboxShadow,
                    ],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        controller.batterInformationData[index].icon,
                      ),
                      const SizedBox(width: 20),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.batterInformationData[index].title,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: BTextTheme.lightTextTheme.labelLarge,
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                controller.batterInformationData[index].subTitle,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: BTextTheme.lightTextTheme.labelLarge!
                                    .copyWith(color: AppColors.secondaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
