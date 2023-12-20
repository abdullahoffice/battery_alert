// utils/screen_utils.dart
import 'package:battery_alert/battery_alert.dart';

class HelperFunc {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
