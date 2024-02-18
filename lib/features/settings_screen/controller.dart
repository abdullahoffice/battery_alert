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
    // SettingModel(title: 'Contact us', icon: AppSvgs.contactUsIcon),
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
        _shareApp();
        break;
      case 3:
        Get.dialog(const BatterAlertUpdates());
        break;
      default:
        break;
    }
  }

  void _shareApp() async {
    await Share.share(
      // 'Check out this awesome app! https://play.google.com/store/apps/details?id=battery_alert',
      'Check out this awesome app! https://play.google.com/store',
    ); // Replace with your app's Play Store URL
  }

  void launchEmailForFeedback() async {
    const email = 'support@tophats.app';
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Feedback&body=Your feedback here',
    );
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      throw 'Could not launch $params';
    }
  }
}
