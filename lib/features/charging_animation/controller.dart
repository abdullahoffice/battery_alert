import '../../battery_alert.dart';

class ChargingAnimController extends GetxController {
  static final instance = Get.find<ChargingAnimController>();

  List<ChargingAnimationModel> chargingAnimationData = [
    ChargingAnimationModel(images: AppImages.animationOne),
    ChargingAnimationModel(images: AppImages.animationTwo),
    ChargingAnimationModel(images: AppImages.animationThree),
    ChargingAnimationModel(images: AppImages.animationFourth),
    ChargingAnimationModel(images: AppImages.animationFifth),
    ChargingAnimationModel(images: AppImages.animationSix),
  ];
}
