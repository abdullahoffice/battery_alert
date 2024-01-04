import 'package:battery_alert/battery_alert.dart';

class CustomAppBar extends GetWidget {
  const CustomAppBar({super.key});

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
      backgroundColor: const Color(0xff0F9F59),
      title: Text(
        'Battery Usage',
        style: BTextTheme.lightTextTheme.titleSmall,
      ),
    );
  }
}
