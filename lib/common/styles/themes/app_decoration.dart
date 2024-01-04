import '../../../battery_alert.dart';

class AppDecorations {
  static BoxShadow get boxShadow => BoxShadow(
        color: Colors.green.withOpacity(0.8),
        spreadRadius: 7.r,
        blurRadius: 5.r,
        offset: const Offset(-6 + 6, 0.9 + 2),
      );
  static BoxShadow get batteryProgressShadow => BoxShadow(
        color: Colors.green.withOpacity(0.8),
        spreadRadius: 20.r,
        blurRadius: 20.r,
        offset: const Offset(-6 + 6, 0.9 + 2),
      );
  static BoxShadow get chargerHistoryShadow => BoxShadow(
        color: Colors.green.withOpacity(0.8),
        spreadRadius: 15.r,
        blurRadius: 20.r,
        offset: const Offset(-6 + 6, 0.9 + 2),
      );
  static BoxShadow get whiteBoxShadow => BoxShadow(
        color: Colors.white.withOpacity(0.9),
        spreadRadius: 1.r,
        blurRadius: 1.r,
        offset: const Offset(-1 + 1, -1 + 0),
      );
  static BoxShadow get alarmSettingShadow => BoxShadow(
        color: Colors.white.withOpacity(0.9),
        spreadRadius: 0.3.r,
        blurRadius: 0.3.r,
        offset: const Offset(-1 + 1, 1 + -0),
      );
  static BoxShadow get smallboxShadow => BoxShadow(
        color: Colors.green.withOpacity(0.9),
        spreadRadius: 2.r,
        blurRadius: 3.r,
        offset: const Offset(1 + -1, -0 + 1.5),
      );
  static BoxShadow get smallWhiteBoxShadow => BoxShadow(
        color: Colors.white.withOpacity(0.8),
        spreadRadius: 0.6.r,
        blurRadius: 5.r,
        offset: const Offset(-1 + 1, 1),
      );

  static BoxDecoration backgroundImageDecoration = const BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AppImages.backgroudImageLight),
      fit: BoxFit.fill,
    ),
  );
}
