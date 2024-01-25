import '../../../battery_alert.dart';

class AnimationView extends GetView<CharAnimController> {
  const AnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
    );
  }

  Widget get _body => GetBuilder<CharAnimController>(initState: (state) {
        // Timer(const Duration(seconds: 3), () {
        //   Get.back();
        // });
      }, builder: (_) {
        return StreamBuilder(
            stream: BatteryInfoPlugin().androidBatteryInfoStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: AppColors.black,
                        child: Image.asset(
                          controller.imageData.isNotEmpty
                              ? controller.imageData
                              : AppGifs.animationOne,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 360.h,
                      right: 115.w,
                      left: 145.w,
                      child: Text(
                        '${(snapshot.data?.batteryLevel)} %',
                        style: BTextTheme.lightTextTheme.headlineLarge,
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      });
}
