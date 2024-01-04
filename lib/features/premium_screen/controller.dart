import '../../battery_alert.dart';

class PremiumController extends GetxController {
  static final instance = Get.find<PremiumController>();
  //*
  List<PremiumModel> premiumData = [
    PremiumModel(
      timePeriod: 'weekly',
      payFor: 'Pay for 7 days',
      price: '\$4.99 USD ',
    ),
    PremiumModel(
      timePeriod: 'mothly',
      payFor: 'Pay monthly',
      price: '\$17.99 USD ',
    ),
    PremiumModel(
      timePeriod: 'Yearly',
      payFor: 'Pay for a full year',
      price: '\$148.99 USD ',
    ),
  ];

  //*
  List<PremiumImageModel> premiumImages = [
    PremiumImageModel(
      image: AppImages.premiumImage,
    ),
    // PremiumImageModel(
    //   image: AppImages.premiumImageTwo,
    // ),
    // PremiumImageModel(
    //   image: AppImages.premiumImageTwo,
    // ),
  ];

  //*
  int currentIndex = 0;
  void setIndex({required int index}) {
    currentIndex = index;
  }
}
