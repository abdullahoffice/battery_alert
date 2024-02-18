import '../../../battery_alert.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.backgroundColor,
        body: _body,
      ),
    );
  }

  Widget get _body => GetBuilder<SplashController>(
        initState: controller.initFunc,
        builder: (_) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/splash_backgroud.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                //*Image
                Positioned(
                  top: 200.h,
                  bottom: 363.h,
                  left: 31.w,
                  right: 32.w,
                  child: _splashImage,
                ),

                //*SplashText
                Positioned(
                  bottom: 80.h,
                  left: 99.w,
                  child: _splashTexts,
                ),

                //*left line
                Positioned(
                  left: 0.1 - 105.w,
                  right: 225.w,
                  top: 29.h,
                  bottom: 340.h,
                  child: _leftLine,
                ),

                //*right line
                Positioned(
                  bottom: 0.1 - 44.h,
                  right: 0.1 - 77.w,
                  left: 236.w,
                  top: 330.h,
                  child: _rightLine,
                ),
              ],
            ),
          );
        },
      );

  //*SplashImage
  Widget get _splashImage => const Image(
        image: AssetImage('assets/images/splash_logo.png'),
      );

  //*SplashText
  Widget get _splashTexts => Column(
        children: [
          Text(
            'Full Battery',
            style: BTextTheme.lightTextTheme.headlineLarge,
          ),
          Text(
            'Alarm',
            softWrap: true,
            style: BTextTheme.lightTextTheme.headlineLarge,
          ),
          Text(
            'Animation with Battery',
            softWrap: true,
            style: BTextTheme.lightTextTheme.titleSmall,
          ),
          Text(
            'Alarm',
            softWrap: true,
            style: BTextTheme.lightTextTheme.titleSmall,
          ),
          SizedBox(height: 20.h),
          Text(
            'Version 1.0.0',
            softWrap: true,
            style: BTextTheme.lightTextTheme.titleSmall,
          ),
        ],
      );

  //*
  Widget get _leftLine =>
      const Image(image: AssetImage('assets/images/left_line.png'));

  //*
  Widget get _rightLine => const Image(
        image: AssetImage('assets/images/right_line.png'),
      );
}
