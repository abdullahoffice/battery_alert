import '../../../battery_alert.dart';

class CrauselImages extends GetWidget<PremiumController> {
  const CrauselImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: controller.premiumImages.length,
      itemBuilder: (context, index, pageViewIndex) {
        return Image.asset(
          controller.premiumImages[index].image,
          fit: BoxFit.fill,
        );
      },
      options: CarouselOptions(
        // onPageChanged: controller,
        aspectRatio: 14 / 9.dg,
        viewportFraction: 0.9.dg,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        enlargeFactor: 0.1.dg,
      ),
    );
  }
}
