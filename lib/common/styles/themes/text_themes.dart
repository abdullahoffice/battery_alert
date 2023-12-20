import '../../../battery_alert.dart';

class BTextTheme {
  BTextTheme._();

  //*Light Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 29.75.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 26.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 17.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 17.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 17.0.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 11.0.sp,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 11.0.sp,
      fontWeight: FontWeight.normal,
      color: Colors.white.withOpacity(0.5),
    ),
  );

  //*dark
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 29.75.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 26.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 21.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 17.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.blackColor,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 11.0.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.blackColor,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.blackColor.withOpacity(0.5),
    ),
  );
}
