import '../../../battery_alert.dart';

class CrauselImages extends GetWidget<PremiumController> {
  const CrauselImages({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PremiumController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  _.setCurrentImageIndex(index);
                },
              ),
              items: _.premiumImages.map((imageModel) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        imageModel.image,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Center(
              child: DotsIndicatorWidget(
                dotsCounts: _.premiumImages.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
