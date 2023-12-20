import '../../../battery_alert.dart';

class RateUsPopup extends StatelessWidget {
  const RateUsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0.h,
          bottom: 0.h,
          left: 0.w,
          right: 0.w,
          child: SizedBox(
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

        //*
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
        ),
      ],
    );
  }
}
