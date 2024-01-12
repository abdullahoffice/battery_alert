import '../../battery_alert.dart';

class SplashController extends GetxController {
  static final instance = Get.find<SplashController>();

  void initFunc(state) => Timer(const Duration(seconds: 3), () {
        Get.offAll(() => const HomeView());
      });
}
