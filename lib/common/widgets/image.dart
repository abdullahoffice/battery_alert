import '../../battery_alert.dart';

class AppImage extends StatelessWidget {
  final Widget image;
  final double? borderRadius;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImage({
    Key? key,
    required this.image,
    this.borderRadius,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  factory AppImage.asset({
    required String image,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    double borderRadius = 12,
  }) =>
      AppImage(
        image: Image.asset(
          image,
          width: width,
          height: height,
          fit: fit,
        ),
        fit: fit,
        width: width,
        borderRadius: borderRadius,
        height: height,
      );

  factory AppImage.network({
    required String image,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    double borderRadius = 12,
  }) =>
      AppImage(
        image: Image.network(
          image,
          width: width,
          height: height,
          fit: fit,
        ),
        fit: fit,
        width: width,
        borderRadius: borderRadius,
        height: height,
      );
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        shape: BoxShape.rectangle,
      ),
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: image,
      ),
    );
  }

  BorderRadius get _borderRadius => BorderRadius.circular(borderRadius ?? 0);
}