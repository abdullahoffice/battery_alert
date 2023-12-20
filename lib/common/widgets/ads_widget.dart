import '../../battery_alert.dart';

class AdsWidget extends GetWidget {
  const AdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffFFD600),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          'ADS',
          style: BTextTheme.lightTextTheme.headlineLarge!
              .copyWith(fontSize: 80.sp, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
