import '../../battery_alert.dart';

class NavigationHeader extends GetWidget {
  final String title;
  const NavigationHeader( {super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          iconPath: AppSvgs.backArrow,
          onPress: (){
            Get.back();
          },
        ),
        SizedBox(width: 10.w),
        Text(
          title,
          style: BTextTheme.lightTextTheme.titleSmall,
        )
      ],
    );
  }
}
