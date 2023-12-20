import '../../battery_alert.dart';

class BAppThemes {
  BAppThemes._();

  //*lightThemes
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Rubik',
    brightness: Brightness.light,
    primaryColor: Colors.white,
    textTheme: BTextTheme.lightTextTheme,
    // scaffoldBackgroundColor: const Color(0xff190D51),
  );
}
