//* Files
// Exporting various parts of your application
export 'app_binding/app_binding.dart';
export 'common/common.dart';
export 'features/features.dart';
export 'packages/packages.dart';
export 'utils/utils.dart';
export 'services/services.dart';
export 'my_app.dart';
export 'core/core.dart';
export 'routes/routes.dart';

//* Packages
// Exporting external packages and plugins used in your application
export 'dart:async';
export 'package:dartz/dartz.dart' hide State;
export 'package:app_usage/app_usage.dart';
// export 'package:battery_alert/battery_alert.dart';
// export 'package:battery_alert/packages/background_services.dart';
export 'package:flutter_background_service/flutter_background_service.dart';
export 'package:flutter_background_service_android/flutter_background_service_android.dart';
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
export 'package:share_plus/share_plus.dart';
export 'package:open_store/open_store.dart';
export 'package:rating_dialog/rating_dialog.dart';
export 'package:in_app_review/in_app_review.dart';
export 'package:file_picker/file_picker.dart';
export 'package:audio_service/audio_service.dart';
export 'package:flutter_foreground_task/flutter_foreground_task.dart';
export 'package:url_launcher/url_launcher.dart';


// Importing additional packages for iOS
export 'package:flutter/material.dart';
// Hide Gradient from dart:ui:
export 'dart:ui'
    hide
        Gradient,
        decodeImageFromList,
        TextStyle,
        ImageDecoderCallback,
        Image,
        StrutStyle;
export 'dart:isolate';

// Or hide Gradient from Flutter:
export 'package:flutter/src/painting/gradient.dart' hide Gradient;
export 'package:flutter/src/widgets/framework.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:flutter_rating_bar/flutter_rating_bar.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/flutter_svg.dart';
// export 'package:flutter_switch/flutter_switch.dart';
export 'package:get/get.dart';
export 'dart:convert' hide Codec;
export 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

//Background services
export 'dart:io' hide HeaderValue;
export 'package:flutter_local_notifications/flutter_local_notifications.dart'
    hide NotificationVisibility;
export 'package:flutter_overlay_window/flutter_overlay_window.dart'
    hide NotificationVisibility;

//Audio
// export 'package:audioplayers/audioplayers.dart';
export 'package:just_audio/just_audio.dart';

// in app purchase
export 'package:onepref/onepref.dart';
