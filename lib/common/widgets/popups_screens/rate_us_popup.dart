import '../../../battery_alert.dart';

double ratingStars = 1;

class RateUsPopup extends GetWidget {
  const RateUsPopup({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 385.h,
        width: 268.w,
        // color: const Color.fromRGBO(0, 0, 0, 1),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: 280.h,
                width: 268.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 25.h),
                    DefaultTextStyle(
                      style: BTextTheme.darkTextTheme.headlineSmall!,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Rate App",
                        style: BTextTheme.darkTextTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    DefaultTextStyle(
                      style: BTextTheme.darkTextTheme.bodyMedium!,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Share your experience & \nfeedback with us",
                        style: BTextTheme.darkTextTheme.labelSmall,
                      ),
                    ),

                    //*stars
                    SizedBox(height: 10.h),

                    Center(
                      child: RatingBar.builder(
                        initialRating: 5,
                        glowColor: Colors.white,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 30.0,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rating) {
                          ratingStars = rating;
                          debugPrint('ratingstars: $ratingStars');
                        },
                        itemBuilder: (context, _) => Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 55.w,
                                  height: 50.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.star_border,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),
                    //*text
                    DefaultTextStyle(
                      style: BTextTheme.darkTextTheme.bodyMedium!,
                      child: Text(
                        textAlign: TextAlign.center,
                        'The best we can get',
                        style: BTextTheme.darkTextTheme.labelSmall,
                      ),
                    ),

                    //*buttons
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(
                                    width: 1.w, color: AppColors.darkPurple),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                )),
                            child: Text(
                              'Not now',
                              style: BTextTheme.darkTextTheme.bodyLarge,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (ratingStars > 3) {
                                // Navigate to Play Store for rating
                                _launchPlayStore();
                                debugPrint('this is on pressed 5');
                              } else if (ratingStars <= 3) {
                                // Navigate to email for feedback
                                launchEmailForFeedback();
                                debugPrint('this is on pressed 3');
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                ),
                              ),
                            ),
                            child: Text(
                              'Rate US',
                              style: BTextTheme.lightTextTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 35.h,
              left: 0,
              right: 0,
              child: Center(
                child: CircleAvatar(
                  radius: 45.5,
                  backgroundColor: Colors.green,
                  child: Image.asset(AppImages.thumbsUpIcon),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





/**SizedBox(
            // height: 500.h,
            // width:double.infinity,
            child: AlertDialog(
              surfaceTintColor: AppColors.primaryColor,
              title: Column(
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    "Rate App",
                    textAlign: TextAlign.center,
                    style: BTextTheme.darkTextTheme.headlineSmall,
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Share your experience & \nfeedback with us",
                    textAlign: TextAlign.center,
                    style: BTextTheme.darkTextTheme.bodyMedium,
                  ),
                  SizedBox(height: 2.h),
                  RatingBar.builder(
                    initialRating: 5,
                    minRating: 5,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                    // unratedColor: Colors.grey,
                    itemBuilder: (context, _) => Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: Colors.green),
                      child: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'The best we can get',
                    style: BTextTheme.darkTextTheme.bodyMedium,
                  ),
                ],
              ),
              actions: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(width: 1.w, color: AppColors.blackColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      )),
                  child: Text(
                    'Not now',
                    style: BTextTheme.darkTextTheme.bodyLarge,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                    ),
                  ),
                  child: Text(
                    'Rate US',
                    style: BTextTheme.lightTextTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),

        //
        Positioned(
            top: 138.h,
            // bottom: 420.h,
            left: 135.w,
            right: 135.w,
            child: SvgPicture.asset(AppSvgs.popupIcon)),
        Positioned(
          top: 138.h,
          // bottom: 435.h,
          left: 138.w,
          right: 138.w,
          child: Image.asset(AppImages.thumbsUpIcon),
        ), */