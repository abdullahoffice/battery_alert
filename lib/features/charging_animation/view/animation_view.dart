import 'package:flutter/services.dart';

import '../../../battery_alert.dart';

class AnimationView extends GetView<CharAnimController> {
  const AnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.func();
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.05),
        child: Text(
          'Double Tap to exist',
          style: BTextTheme.lightTextTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
      body: GestureDetector(
          onDoubleTap: () {
            SystemNavigator.pop();
          },
          child: _body),
    );
  }

  Widget get _body => GetBuilder<CharAnimController>(initState: (state) {
        // Timer(const Duration(seconds: 3), () {
        //   debugPrint('Animation Screen');
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
                      top: 320.h,
                      right: 11.w,
                      left: 152.w,
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
