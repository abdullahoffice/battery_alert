import '../../../battery_alert.dart';

class RoundIconBox extends GetWidget {
  final String icon;
  const RoundIconBox({required this.icon, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: const Color(0xff1C005B),
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(),
        ],
      ),
      child: Center(
        //!
        child: SvgPicture.asset(
          icon,
          color: Colors.white,
          width: 28.w,
        ),
      ),
    );
  }
}
