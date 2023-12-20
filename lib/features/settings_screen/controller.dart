import '../../battery_alert.dart';

class SettingController extends GetxController {
  static final instance = Get.find<SettingController>();

  List<Widget Function()> showPopUp = [
    () => const AdFreePopup(),
    () => const AdFreePopup(),
    () => const AdFreePopup(),
    () => const AdFreePopup(),
    () => const AdFreePopup(),
  ];

  List<SettingModel> settingsData = [
    SettingModel(title: 'Buy AdFree Version', icon: AppSvgs.crownIcon),
    SettingModel(title: 'Rate this App', icon: AppSvgs.feedBackIcon),
    SettingModel(title: 'Share App', icon: AppSvgs.shareIcon),
    SettingModel(title: 'Privacy policy', icon: AppSvgs.praivayIcon),
    SettingModel(title: 'Check Updates', icon: AppSvgs.updatesIcon),
  ];

  int currentIndex = 0;
  void settingonPress({required int index}) {
    currentIndex = index;
    update();
    switch (index) {
      case 0:
        Get.dialog(const AdFreePopup());
        break;
      case 1:
        Get.dialog(const RateUsPopup());
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        Get.dialog(const BatterAlertUpdates());
        break;
      default:
        break;
    }
  }
}
