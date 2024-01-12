import '../../../battery_alert.dart';

class CustomContainer extends StatelessWidget {
  final String valueText;
  final String value;

  const CustomContainer(
      {super.key, required this.valueText, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.w,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.purpleColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            valueText,
            style: BTextTheme.lightTextTheme.titleSmall,
          ),
          SizedBox(height: 3.h),
          Text(
            value,
            style: BTextTheme.lightTextTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
