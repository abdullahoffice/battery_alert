import '../../battery_alert.dart';

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPress;

  const CustomIconButton({
    super.key,
    required this.iconPath,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 40.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: AppColors.clearButtonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            color: Colors.white,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
