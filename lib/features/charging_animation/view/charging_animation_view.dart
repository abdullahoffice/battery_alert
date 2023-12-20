import '../../../battery_alert.dart';

class ChargingAnimationView extends GetView<ChargingAnimController> {
  const ChargingAnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
      ),
    );
  }

  //*
  Widget get _body => GetBuilder<ChargingAnimController>(builder: (_) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: AppDecorations.backgroundImageDecoration,
            child: Column(
              children: [
                const NavigationHeader(title: 'Charging Animation'),

                //*SliderANimations
                SizedBox(height: 76.h),
                _imageSlider,
                const Spacer(),
                //*button
                SizedBox(height: 16.h),
                testingButton(
                  ontap: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ),
        );
      });

  //*ImagesCrausal
  Widget get _imageSlider => CarouselSlider.builder(
        itemCount: controller.chargingAnimationData.length,
        itemBuilder: (context, index, pageViewIndex) {
          return SizedBox(
            // height: 705.h,
            width: 220.w,
            child: Image.asset(
              controller.chargingAnimationData[index].images,
              fit: BoxFit.contain,
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 7 / 9.dg,
          viewportFraction: 0.7.dg,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          enlargeFactor: 0.4.dg,
        ),
      );

  //* Button
  Widget testingButton({required VoidCallback ontap}) => GestureDetector(
        onTap: ontap,
        child: Container(
          width: 117.w,
          height: 46.h,
          decoration: BoxDecoration(
            boxShadow: [
              AppDecorations.smallboxShadow,
              AppDecorations.smallWhiteBoxShadow,
            ],
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'Apply',
              style: BTextTheme.lightTextTheme.bodyLarge,
            ),
          ),
        ),
      );
}
