import '../../../battery_alert.dart';

Widget cardBox({required String text1,required String image,required VoidCallback onTap}) => GestureDetector(
  onTap: onTap,
  child: Container(
        // height: 68.h,
        width: 150.w,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          boxShadow: [
            AppDecorations.smallboxShadow,
            AppDecorations.smallWhiteBoxShadow,
          ],
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text1,
              textAlign: TextAlign.left,
              style: BTextTheme.lightTextTheme.labelLarge,
            ),
            SvgPicture.asset(
              
              image,height: 35.h,
            ),
          ],
        ),
      ),
);
