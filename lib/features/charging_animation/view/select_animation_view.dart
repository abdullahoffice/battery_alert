import '../../../battery_alert.dart';

int globalSelectedIndex = 1;

class SelectAnimation extends GetView<CharAnimController> {
  const SelectAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: const CustomAppBar(title: 'Charging Animation')),
      ),
    );
  }

  //*
  Widget get _body => GetBuilder<CharAnimController>(builder: (_) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: AppDecorations.backgroundImageDecoration,
            child: Column(
              children: [
                // const NavigationHeader(title: 'Charging Animation'),

                //*SliderANimations
                SizedBox(height: 76.h),
                Expanded(
                  flex: 7,
                  child: CarouselSlider.builder(
                    itemCount: controller.chargingAnimationData.length,
                    itemBuilder: (context, index, pageViewIndex) {
                      return GestureDetector(
                        onTap: () {
                          controller.saveSelectedImage(
                            imagePath:
                                controller.chargingAnimationData[index].images,
                          );
                          if (HomeController.instance.animationBoolValue) {
                            debugPrint(
                                'Value: ${HomeController.instance.animationBoolValue}');
                            Get.to(() => const AnimationView());
                          }
                          CharAnimController.instance.getSelectedImage();
                          debugPrint(
                              'index: ${controller.chargingAnimationData[globalSelectedIndex].images}');
                          // debugPrint('Get: ${controller.imageData}');
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                AppImages.animationBackground,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                bottom: 145.h,
                                left: 20.w,
                                right: 20.w,
                                top: 20.h, // Adjust the top margin as needed

                                child: Image.asset(
                                  controller
                                      .chargingAnimationData[index].images,
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      // height: 300,
                      // autoPlay: true,
                      // enlargeCenterPage: true,
                      aspectRatio: 14 / 7.dg,
                      viewportFraction: 0.9.dg,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      enlargeFactor: 0.4.dg,
                      onPageChanged: (index, reason) {
                        globalSelectedIndex = index;
                      },
                    ),
                  ),
                ),

                //*Button
                const SizedBox(height: 10),
                applyButton(
                  ontap: ()
                      //async
                      {
                    controller.saveSelectedImage(
                      imagePath: controller
                          .chargingAnimationData[globalSelectedIndex].images,
                    );
                    debugPrint(
                        'index: ${controller.chargingAnimationData[globalSelectedIndex].images}');
                    debugPrint('Get: ${controller.imageData}');
                  },
                ),
                // applyButton(ontap: controller.getSelectedImage),
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
          onPageChanged: (index, reason) {
            // controller.saveSelectedImage();
          },
        ),
      );

  //* Button
  Widget applyButton({required VoidCallback ontap}) => GestureDetector(
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

// final currentIndex = _imageSlider
                    //     .current; // Get the current index of the slider
                    // final currentImagePath = controller
                    //     .chargingAnimationData[currentIndex]
                    //     .images; // Access the image path from the controller
                    // await controller.saveSelectedImage(
                    //     imagePath: currentImagePath); // Call the save function