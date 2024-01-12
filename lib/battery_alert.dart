//* Files
// Exporting various parts of your application
export 'app_binding/app_binding.dart';
export 'common/common.dart';
export 'features/features.dart';
export 'packages/packages.dart';
export 'utils/utils.dart';
export 'handlers/handlers.dart';
export 'services/services.dart';
export 'my_app.dart';

//* Packages
// Exporting external packages and plugins used in your application
export 'dart:async';
export 'package:dartz/dartz.dart' hide State;
export 'package:app_usage/app_usage.dart';
export 'package:battery_alert/battery_alert.dart';
export 'package:battery_alert/packages/background_services.dart';
export 'package:flutter_background_service/flutter_background_service.dart';
export 'package:battery_info/battery_info_plugin.dart';
export 'package:battery_info/model/android_battery_info.dart';
export 'package:battery_info/enums/charging_status.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:fluttertoast/fluttertoast.dart';
export 'package:device_apps/device_apps.dart';

// Importing additional packages for Android
export 'package:battery_info/model/iso_battery_info.dart';
export 'package:battery_plus/battery_plus.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:device_info_plus/device_info_plus.dart';
export 'package:dots_indicator/dots_indicator.dart';
export 'package:dotted_border/dotted_border.dart';

// Importing additional packages for iOS
export 'package:flutter/material.dart';
export 'package:flutter/src/widgets/framework.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:flutter_rating_bar/flutter_rating_bar.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:flutter_switch/flutter_switch.dart';
export 'package:get/get.dart';
export 'dart:convert';
export 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
