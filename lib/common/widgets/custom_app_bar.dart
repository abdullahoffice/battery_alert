import 'package:battery_alert/battery_alert.dart';

class CustomAppBar extends GetWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomIconButton(
          iconPath: AppSvgs.backArrow,
          onPress: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      title: Text(
        title,
        style: BTextTheme.lightTextTheme.titleSmall,
      ),
    );
  }
}
