import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

import '../../battery_alert.dart';

class PremiumController extends GetxController {
  // List Products
  late final List<ProductDetails> products = <ProductDetails>[];
  // List ProductsIds
  late final List<ProductId> productIds = <ProductId>[
    ProductId(id: "weekly", isConsumable: false),
    ProductId(id: "mothly", isConsumable: false),
    ProductId(id: "yearly", isConsumable: false),
  ];

  //IApEngine
  IApEngine iApEngine = IApEngine();

  //bool
  bool isSubscribe = false;
  static final instance = Get.find<PremiumController>();

  // Called when the controller is initialized
  @override
  void onInit() {
    super.onInit();
    // Start listening for purchase events and restores
    iApEngine.inAppPurchase.purchaseStream.listen((listOfPurchaseDetails) {
      // Handle incoming purchase events
      listenPurchases(listOfPurchaseDetails);
    });
    // Fetch product details from the IAP engine
    getProduct();
    //  Restore any previous purchases
    isSubscribe = OnePref.getPremium() ?? false;
  }

  // Retrieves product details from the IAP engine
  void getProduct() async {
    // Check if the IAP engine is available
    await iApEngine.getIsAvailable().then((isAvailable) {
      if (isAvailable) {
        // Query for product details
        iApEngine.queryProducts(productIds).then((res) {
          // Log any product IDs that were not found
          debugPrint('Not Found Ids: ${res.notFoundIDs}');
          // Clear any existing product data
          products.clear();
          // Add the retrieved product details to the list
          products.addAll(res.productDetails);
          update();
        });
      }
    });
  }

  // Updates the selected payment method index
  int currentIndex = 0;
  void setIndex(int index) {
    currentIndex = index;
    update();
  }

  // Handles incoming purchase events
  Future<void> listenPurchases(List<PurchaseDetails> list) async {
    // Check for purchases or restorations
    if (list.isNotEmpty) {
      for (PurchaseDetails purchaseDetails in list) {
        if (purchaseDetails.status == PurchaseStatus.restored ||
            purchaseDetails.status == PurchaseStatus.purchased) {
          // acknowledge: false/true
          debugPrint(
            'Local verification data:  ${purchaseDetails.verificationData.localVerificationData}',
          );
          // Determine if it's a first-time purchase or a restore
          Map purchaseData = json.decode(
            purchaseDetails.verificationData.localVerificationData,
          );
          if (purchaseData["ackowledged"]) {
            debugPrint('Restore purchase ');
            updateIsSub(true);
          } else {
            debugPrint('First time purchase ');
            //android: Consume the purchase on Android (if applicable)
            if (Platform.isAndroid) {
              final InAppPurchaseAndroidPlatformAddition
                  androidPlatformAddition = iApEngine.inAppPurchase
                      .getPlatformAddition<
                          InAppPurchaseAndroidPlatformAddition>();
              await androidPlatformAddition
                  .consumePurchase(purchaseDetails)
                  .then((value) {
                updateIsSub(true);
              });
            }

            // Complete the purchase if necessary
            if (purchaseDetails.pendingCompletePurchase) {
              await iApEngine.inAppPurchase
                  .completePurchase(purchaseDetails)
                  .then(
                (value) {
                  updateIsSub(true);
                },
              );
            }
          }
        }
      }
    } else {
      // No purchases found, handle accordingly
      updateIsSub(false);
    }
  }

// Updates subscription status and persistence
  void updateIsSub(bool value) {
    isSubscribe = value;
    OnePref.setPremium(isSubscribe); // Save to preferences
    update();
  }

// Manages the current carousel image index and dots indicator
  int _currentImageIndex = 0;
  int get currentImageIndex => (_currentImageIndex % premiumImages.length);
  void setCurrentImageIndex(int index) {
    _currentImageIndex = index;
    update();
  }

//..
  List<PremiumModel> premiumData = [
    PremiumModel(
      timePeriod: 'weekly',
      payFor: 'Pay for 7 days',
      price: '\$4.99 USD ',
      'weekly',
    ),
    PremiumModel(
      timePeriod: 'mothly',
      payFor: 'Pay monthly',
      price: '\$17.99 USD ',
      'Most popular',
    ),
    PremiumModel(
      timePeriod: 'Yearly',
      payFor: 'Pay for a full year',
      price: '\$148.99 USD ',
      'Save 12%',
    ),
  ];

  //*
  List<PremiumImageModel> premiumImages = [
    PremiumImageModel(
      image: AppImages.premiumImage,
    ),
    PremiumImageModel(
      image: AppImages.premiumImage,
    ),
  ];
}
