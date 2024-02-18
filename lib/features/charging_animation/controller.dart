import 'package:flutter/services.dart';

import '../../battery_alert.dart';

class CharAnimController extends GetxController {
  static final instance = Get.find<CharAnimController>();

  void func() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      battery.onBatteryStateChanged.listen((event) {
        if (event == BatteryState.discharging) {
          SystemNavigator.pop();
        }
      });
      update();
    });
  }

  // List<ChargingAnimationModel> chargingAnimationData1 = [
  //   // ChargingAnimationModel(images: AppImages.animationOne),
  //   ChargingAnimationModel(images: AppImages.animationTwo),
  //   ChargingAnimationModel(images: AppImages.animationTwo),
  //   ChargingAnimationModel(images: AppImages.animationTwo),
  //   ChargingAnimationModel(images: AppImages.animationTwo),
  //   // ChargingAnimationModel(images: AppImages.animationTwo),

  //   // ChargingAnimationModel(images: AppImages.animationThree),
  //   // ChargingAnimationModel(images: AppImages.animationFourth),
  //   // ChargingAnimationModel(images: AppImages.animationFifth),
  //   // ChargingAnimationModel(images: AppImages.animationSix),
  // ];
  // late List char = [
  //   const Image(image: AssetImage(AppImages.animationThree)),
  //   const Image(image: AssetImage(AppGifs.animationFifth)),
  //   const Image(image: AssetImage(AppGifs.animationFourth)),
  //   const Image(image: AssetImage(AppImages.animationSix)),
  //   const Padding(
  //     padding: EdgeInsets.only(top: 20),
  //     child: Image(image: AssetImage(AppImages.animationTwo)),
  //   ),
  // ];
  List<ChargingAnimationModel> chargingAnimationData = [
    ChargingAnimationModel(images: AppGifs.animationFifth),
    ChargingAnimationModel(images: AppGifs.animationThree),
    ChargingAnimationModel(images: AppGifs.animationFourth),
    // ChargingAnimationModel(images: AppGifs.animationTwo),
    // ChargingAnimationModel(images: AppGifs.animationSix),
    // ChargingAnimationModel(images: AppGifs.animationSeven),
    // ChargingAnimationModel(images: AppGifs.animationEight),
    // ChargingAnimationModel(images: AppGifs.animationNine),
    // ChargingAnimationModel(images: AppGifs.animationTen),
  ];
  // RxString selectedImagePath = RxString('');

  //*setImage
  Future<void> saveSelectedImage({required String imagePath}) async {
    final result = await BatteryAlertStorage.getInstance();
    result.saveSelectedImage(imagePath: imagePath);
    update();
  }

  //*getImage
  String imageData = AppGifs.animationFifth;
  Future<void> getSelectedImage() async {
    debugPrint('Width: ');
    final result = await BatteryAlertStorage.getInstance();
    final data = await result.getSelectedImage();
    data.fold((errorMessage) {
      Fluttertoast.showToast(msg: errorMessage);
    }, (fetcheddata) {
      if (fetcheddata != null) {
        imageData = fetcheddata;
        // Fluttertoast.showToast(msg: 'Charger Connected');
      }
    });

    update();
    // debugPrint('ImageString: ${await result.getSelectedImage()}');
  }

  //*showAnimation
  final Battery battery = Battery();

  // Future<void> showAnimation() async {
  //   BatteryInfoPlugin().androidBatteryInfoStream.listen((batteryInfo) async {
  //     if (batteryInfo != null) {
  //       final BatteryState batteryState = await battery.batteryState;
  //       if (batteryState == BatteryState.charging ||
  //           batteryStatus == BatteryState.full) {
  //         Get.to(() => const AnimationView());
  //       } else {
  //         Fluttertoast.showToast(msg: 'Device is not plugged in');
  //       }
  //     }
  // });
  // }
}
