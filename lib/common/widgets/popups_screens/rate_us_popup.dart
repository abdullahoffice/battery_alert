import '../../../battery_alert.dart';

class RateUsPopup extends GetWidget {
  const RateUsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 395.h,
        width: 278.w,
        // color: const Color.fromRGBO(0, 0, 0, 1),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: 320.h,
                width: 278.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 25.h),
                    DefaultTextStyle(
                      style: BTextTheme.darkTextTheme.headlineSmall!,
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Rate App",
                      ),
                    ),
                    SizedBox(height: 10.h),
                    DefaultTextStyle(
                      style: BTextTheme.darkTextTheme.bodyMedium!,
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Share your experience & \nfeedback with us",
                      ),
                    ),

                    //*stars
                    SizedBox(height: 10.h),
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
                    SizedBox(height: 10.h),
                    //*text
                    DefaultTextStyle(
                      style: BTextTheme.darkTextTheme.bodyMedium!,
                      child: const Text(
                        textAlign: TextAlign.center,
                        'The best we can get',
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
                                    width: 1.w, color: AppColors.blackColor),
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
                            onPressed: () {},
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
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: CircleAvatar(
                  radius: 50.5,
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