import '../../../battery_alert.dart';

class GridCardWidget extends StatelessWidget {
  final String chargingStatus;
  final String title;
  final String icon;

  const GridCardWidget({
    Key? key,
    required this.chargingStatus,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      decoration: _boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            icon,
          ),
          _horizontalSpace,
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: BTextTheme.lightTextTheme.labelLarge,
                ),
                SizedBox(
                  width: 100.w,
                  child: Text(
                    chargingStatus,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: BTextTheme.lightTextTheme.labelLarge!.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //*
  get _gridDelegate => SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 9.h,
        crossAxisCount: 2,
        childAspectRatio: 2.8,
      );
  //*
  BoxDecoration get _boxDecoration => BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          AppDecorations.smallWhiteBoxShadow,
          AppDecorations.smallboxShadow,
        ],
        borderRadius: BorderRadius.circular(10.r),
      );
  Widget get _horizontalSpace => SizedBox(width: 20.h);
}
