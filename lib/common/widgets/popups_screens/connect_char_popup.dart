import '../../../battery_alert.dart';

class ConnectCharPopup extends StatelessWidget {
  const ConnectCharPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0.r),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //*
          _connectChargerText,

          //*image
          SizedBox(
            height: 100, // Adjust the height as needed
            child: Image.asset(
              AppImages.connectCharger,
              fit: BoxFit.contain,
            ),
          ),

          //*
          SizedBox(height: 10.h),
          _buttons,
        ],
      ),
    );
  }

  //*Connect Charger Text
  Widget get _connectChargerText => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text('Connect Your \nCharger',
            textAlign: TextAlign.center,
            style: BTextTheme.darkTextTheme.headlineMedium),
      );

  //*Buttons
  Widget get _buttons => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              side: const BorderSide(width: 1, color: AppColors.darkPurple),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.r),
              ),
            ),
            child: Text(
              'Not Now',
              style: BTextTheme.darkTextTheme.bodyLarge,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // for rating
              _launchPlayStore();
              // _launchEmailForFeedback();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Rate Us',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
  // Function to launch Play Store for rating
  void _launchPlayStore() async {
    // const url =
    //     'https://play.google.com/store/apps/details?id=YOUR_APP_PACKAGE_NAME';
    const url = 'https://play.google.com/store';
    final Uri playStoreUrl = Uri.parse(url);
    if (await canLaunchUrl(playStoreUrl)) {
      await launchUrl(playStoreUrl);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to launch email client for feedback
  void _launchEmailForFeedback() async {
    const email = 'your@email.com';
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
