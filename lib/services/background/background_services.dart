import 'dart:ui';

// import 'package:batteryanimation/services/notification.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:torch_light/torch_light.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:battery_plus/battery_plus.dart';

import '../../battery_alert.dart';

Future<void> initialiseService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
    androidConfiguration: AndroidConfiguration(
        onStart: onStart, isForegroundMode: true, autoStart: true),
  );
}

bool isPlayAlarm = false;

///set method for ios
@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

bool isTorchOn = false;
bool isTorchOnRhy = false;

///call flash light
void startBlinking() async {
  isTorchOn = true;
  int blinkCount = 20;
  for (int i = 0; i < blinkCount; i++) {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {}
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      // Handle error
    }
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );
  }
  isTorchOn = false;
}

///start light blinking with rhythm
void startBlinkingRhythm() async {
  isTorchOnRhy = true;
  // Define the number of times you want the torch to blink
  // int blinkCount = int.parse(count.toStringAsFixed(0));
  int blinkCount = 15;

  for (int i = 0; i < blinkCount; i++) {
    if (kDebugMode) {
      print(blinkCount);
    }
    await Future.delayed(const Duration(milliseconds: 100));
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      // Handle error
    }
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      // Handle error
    }

    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      // Handle error
    }
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      // Handle error
    }
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      // Handle error
    }
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      // Handle error
    }
    await Future.delayed(
      const Duration(milliseconds: 200),
    );
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      // Handle error
    }
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      // Handle error
    }
  }
  isTorchOnRhy = false;
}

///vibrate phone
bool isVibrate = false;
Future<void> vibrationPhone(int time) async {
  isVibrate = true;
  await Vibration.vibrate(duration: time);
  isVibrate = false;
}

///vibrate phone low bat
bool isVibrateLow = false;
Future<void> vibrationPhoneLow() async {
  isVibrateLow = true;
  await Vibration.vibrate(duration: 3000);
  isVibrateLow = false;
}

///play audio from asset
Future<void> playSoundFromPaths(String sound) async {
  advancedPlayer.setFilePath(sound);
  advancedPlayer.play();
  await vibrationPhone(advancedPlayer.duration!.inSeconds);
}

bool isValueSaved = false;
String getCurrentTime() {
  var now = DateTime.now();
  var formatter = DateFormat('HH:mm:ss MMM d');
  return formatter.format(now);
}

bool isOpen = false;
AudioPlayer advancedPlayer = AudioPlayer();
bool playMusic = false;
Future<void> loadAudio() async {
  playMusic = true;
  try {
    await advancedPlayer
        .setAsset('assets/alram_tune.mp3'); // Replace with your audio file path
    await advancedPlayer.play();
    await vibrationPhone(advancedPlayer.duration!.inSeconds);
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
  }
  playMusic = true;
}

void stopMusicNotifi(int action) async {
  if (action == 0) {
    await advancedPlayer.stop();
    NotificationService().cancelNotifi(action);
  }
}

bool isFulNotify = false;
@pragma('vm:entry-point')
void showNotifi(int bat) async {
  isFulNotify = true;
  await NotificationService().sendNotification(
      "Battery Alert Notification Sent",
      'Your Battery Alert is at ${bat.toStringAsFixed(0)}.');
  isFulNotify = false;
}

///stop battery timer
Future<void> stopTime(int batteryLevel) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> timelist = prefs.getStringList('endList') ?? [];
  List<String> plugOutlist = prefs.getStringList('plugOut') ?? [];
  timelist.insert(0, getCurrentTime());
  plugOutlist.insert(0, batteryLevel.toString());
  // print(plugOutlist);
  // print(timelist);
  prefs.setStringList('endList', timelist);
  prefs.setStringList('plugOut', plugOutlist);
}

///start battery timer
Future<void> startTime(int bat) async {
  // print('start from here');
  final prefs = await SharedPreferences.getInstance();
  List<String> timelist = prefs.getStringList('startList') ?? [];
  List<String> plugInlist = prefs.getStringList('plugIn') ?? [];
  plugInlist.insert(0, bat.toString());
  timelist.insert(0, getCurrentTime());

  prefs.setStringList('startList', timelist);
  prefs.setStringList('plugIn', plugInlist);
}

///set method for on start background service
@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  debugPrint('start........');
  // Fluttertoast.showToast(msg: 'Background services running');
  final Battery battery = Battery();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }
  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  final prefs = await SharedPreferences.getInstance();
  battery.onBatteryStateChanged.listen(
    (batteryListen) async {
      var fullBat = prefs.getDouble('fullBatterySlider') ?? 0.0;
      var lowBat = prefs.getDouble('lowBatterySlider') ?? 0.0;
      var flashCount = prefs.getDouble('flashSlider') ?? 5.0;
      var chargeAnim = prefs.getBool('animEnb') ?? false;
      var vibrationVal = prefs.getBool('vibrationBattery') ?? false;
      var alarmSet = prefs.getBool('alarmEnb') ?? false;
      var flashLight = prefs.getBool('flashLight') ?? false;
      var selectedAudio = prefs.getString('audioTune') ?? '';
      var getFlashType = prefs.getString('flashType') ?? 'continues';
      int fulbat = int.parse(fullBat.toStringAsFixed(0));
      int lowbat = int.parse(lowBat.toStringAsFixed(0));
      int bat = await battery.batteryLevel;
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          if (batteryListen == BatteryState.charging) {
            if (!isValueSaved) {
              isValueSaved = true;
              await startTime(bat);
            }
            if (bat == 100) {
              showNotifi(bat);
            }
            if (bat == 15) {
              showNotifi(bat);
            }
            if (kDebugMode) {
              print(fulbat);
              print(bat);
            }

            // /alert user aat battery Full alarm
            if (bat == fulbat) {
              if (kDebugMode) {
                print(int.parse(fullBat.toStringAsFixed(0)));
              }
              if (!isPlayAlarm || flashLight || vibrationVal) {
                getFlashType == "continues"
                    ? startBlinking()
                    : startBlinkingRhythm(); //startBlinkingRhythm
                // await vibrationPhone();
                selectedAudio == ''
                    ? await loadAudio()
                    : playSoundFromPaths(selectedAudio);
                // await loadAudio();
                await NotificationService().sendNotification(
                    "Battery Alert Notification Sent",
                    'Your Battery Alert is at ${bat.toStringAsFixed(0)}.');
              }
            } else {
              // print('no call for notifications');
            }
            if (chargeAnim == false) {
              if (!isOpen) {
                isOpen = true;
                debugPrint('Animation function');
                FlutterForegroundTask.wakeUpScreen();
                FlutterForegroundTask.setOnLockScreenVisibility(true);
                // FlutterForegroundTask.launchApp('/second');
                FlutterForegroundTask.launchApp(
                    RouteName.chargingAnimationScreen);
              }
            }
            service.setForegroundNotificationInfo(
                title: "Full Battery Alarm Running", content: "Tap To Open");
          } else if (batteryListen == BatteryState.discharging) {
            if (isValueSaved) {
              isValueSaved = false;
              await stopTime(bat);
            }

            ///alert user aat battery low alarm
            if (bat == lowbat) {
              if (kDebugMode) {}
              if (!isPlayAlarm || flashLight || vibrationVal) {
                getFlashType == "continues"
                    ? startBlinking()
                    : startBlinkingRhythm();
                // await vibrationPhoneLow();
                await loadAudio();
                if (alarmSet == false) {
                  await NotificationService().sendNotification(
                      "Battery Alert Notification Sent",
                      'Your Battery Alert is at ${bat.toStringAsFixed(0)}.');
                }
              }
            } else {
              // print('no call for notifications');
            }
            isPlayAlarm = false;
            isOpen = false;
            // FlutterForegroundTask.minimizeApp();
            service.setForegroundNotificationInfo(
                title: "Full Battery Alarm Running", content: "Tap To Open");
          } else {
            isOpen = false;
            service.setForegroundNotificationInfo(
                title: "Full Battery Alarm Running", content: "Tap To Open");
          }
        }
      }
    },
  );

  service.invoke('update');
}
