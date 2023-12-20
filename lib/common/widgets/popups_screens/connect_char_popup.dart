import '../../../battery_alert.dart'; // Import Get for Get.back()

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
              side: const BorderSide(width: 1, color: AppColors.blackColor),
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
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Check',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
}
