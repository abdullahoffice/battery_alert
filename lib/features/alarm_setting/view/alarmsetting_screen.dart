import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:torch_light/torch_light.dart';
import 'package:vibration/vibration.dart';

import '../../../battery_alert.dart';

class AlarmSettingsScreen extends StatefulWidget {
  final String splash = '/splash';
  const AlarmSettingsScreen({super.key});

  @override
  State<AlarmSettingsScreen> createState() => _AlarmSettingsScreenState();
}

class _AlarmSettingsScreenState extends State<AlarmSettingsScreen> {
  double _value = 0.0;
  double _value1 = 0.0;
  bool isCheck = false;
  bool isCheck1 = false;
  bool isCheck2 = false;
  bool isAudioPlay = false;
  bool isVolumeChk = false;
  double volumeSlider = 10;
  double volumeSlider2 = 5.0;
  AudioPlayer advancedPlayer = AudioPlayer();
  bool isVibrating = false;
  //audio == null ? null : playSoundFromPaths(audio!);
  FilePickerResult? pickedFile;
  String? audio;
  String? fileName;
  Future<void> playSoundFromPaths(String sound) async {
    advancedPlayer.setFilePath(sound);
    advancedPlayer.play();
  }

  void playAudioAsset() async {
    try {
      await advancedPlayer.setAsset(
        'assets/alram_tune.mp3',
      );
      // Replace with your audio file path
      await advancedPlayer.play();
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  var items = [
    'Continuous',
    'Rhythm',
  ];
  // String dropdownvalue = 'Continuous';

  @override
  void initState() {
    super.initState();
    loadFlashSlider();
    loadSliderVal();
    loadSliderVolume();
    loadBoolFromSharedPreferencesLow();
    loadFlashLight();
    loadSliderValLow();
    getAssetAudio();
    getTypeVal();
    loadBoolFromSharedPreferences();
    loadBoolVibra();
  }

  @override
  void dispose() {
    AssetsAudioPlayer.newPlayer().dispose();
    advancedPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(title: 'Alarm Setting'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppDecorations.backgroundImageDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).height * 0.03),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              AlarmSettingsWidget(
                onEndSlider: setSliderVal,
                valueSlider: _value,
                min: 0.0,
                max: 100.0,
                value: isCheck,
                onChangedSwitch: toggleBool,
                onChangedSlider: toggleSlider,
                percentageVal: _value.toStringAsFixed(0),
                stringText: 'Full Battery Alarm',
                textColor: Colors.white,
                notifyText: "App Will Send you Notification When Battery Full.",
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              AlarmSettingsWidget(
                onEndSlider: setSliderValLow,
                min: 0.0,
                max: 40.0,
                notifyText: "App Will Send you Notification When Battery Low.",
                value: isCheck1,
                onChangedSwitch: toggleBoolLow,
                valueSlider: _value1,
                onChangedSlider: toggleSliderLow,
                percentageVal: _value1.toStringAsFixed(0),
                stringText: 'Low Battery Alarm',
                textColor: Colors.yellow,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              SetAlarmRingtoneWidget(
                audioFileTap: () => chooseAudio(),
                volumeVal: volumeSlider,
                onVolumeChange: toggleSliderVolume,
                vibrationbool: vibration,
                vibrationChg: toggleBoolVibration,
                audioName:
                    fileName == null ? "default audio" : fileName.toString(),
                iconwid: IconButton(
                    onPressed: () {
                      if (isAudioPlay) {
                        advancedPlayer.stop();
                        stopVibration();
                      } else {
                        if (audio != null) {
                          if (vibration) {
                            startVibration(true);
                          }
                          playSoundFromPaths(audio!);
                        } else {
                          if (vibration) {
                            startVibration(true);
                          }
                          playAudioAsset();
                        }
                      }
                      setState(() {
                        isAudioPlay = !isAudioPlay;
                      });
                    },
                    icon: Icon(
                      isAudioPlay ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              SetFlashLightWidget(
                dropButton: GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                audioFileTap: () {},
                volumeVal: volumeSlider2,
                onVolumeChange: toggleFlashSlider,
                vibrationbool: vibration,
                vibrationChg: toggleBoolVibration,
                audioName: '',
                iconwid: Switch(
                  inactiveTrackColor: Colors.black,
                  activeColor: Colors.white,
                  value: isVolumeChk,
                  onChanged: toggleFlashlight,
                ),
                flashCount: volumeSlider2.toStringAsFixed(0),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void startVibration(bool isPlay) async {
    try {
      if (isPlay) {
        if (await Vibration.hasVibrator() != null) {
          isVibrating = true;
          setState(() {});
          while (isVibrating) {
            Vibration.vibrate(duration: 2000); // Vibrate for 0.5 seconds
            await Future.delayed(
                const Duration(seconds: 1)); // Pause for 1 second
          }
        } else {}
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void stopVibration() {
    isVibrating = false;
    Vibration.cancel();
    setState(() {});
  }

  ///start blinking light

  void chooseAudio() async {
    advancedPlayer.stop();
    final prefs = await SharedPreferences.getInstance();
    pickedFile = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (pickedFile != null) {
      try {
        setState(() {
          audio = pickedFile!.files.first.path;
          fileName = pickedFile!.files.first.name;
          prefs.setString("audioTune", audio.toString());
          prefs.setString("fileName", fileName.toString());
          audio == null ? null : playSoundFromPaths(audio!);
          if (kDebugMode) {
            print("File Audio : $audio");
            print("File name : $fileName");
          }
        });
      } catch (err) {
        if (kDebugMode) {
          print(err);
        }
      }
    } else {
      if (kDebugMode) {
        print('No Audio Selected');
      }
    }
  }

  void getAssetAudio() async {
    final prefs = await SharedPreferences.getInstance();
    fileName = prefs.getString('fileName');
    setState(() {});
  }

  ///values for switch battery full
  Future<void> saveBoolToSharedPreferences(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('fullBattery', value);
  }

  Future<bool> getBoolFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('fullBattery') ?? false;
  }

  void toggleBool(bool value) {
    setState(() {
      isCheck = value;
      if (isCheck) {
        NotificationService().sendNotification('Full Battery Alarm',
            "App Will Send You Notification When Battery Full.");
      }
      saveBoolToSharedPreferences(value);
    });
  }

  Future<void> loadBoolFromSharedPreferences() async {
    final value = await getBoolFromSharedPreferences();
    setState(() {
      isCheck = value;
    });
  }

  Future<void> setSliderVal(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fullBatterySlider', value);
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    try {
      if (isRunning) {
        service.invoke("stopService");
      }
      Future.delayed(const Duration(seconds: 4)).then((value) async {
        await initialiseService();
      });
      // service.startService();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<double> getSliderVal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('fullBatterySlider') ?? 0.0;
  }

  Future<void> loadSliderVal() async {
    final value = await getSliderVal();
    setState(() {
      _value = value;
    });
    if (kDebugMode) {
      print(
        int.parse(
          value.toStringAsFixed(0),
        ),
      );
    }
  }

  void toggleSlider(double value) {
    setState(() {
      _value = value;
      if (kDebugMode) {}
    });
  }

  Future<void> saveBoolToSharedPreferencesLowBattery(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('lowBattery', value);
  }

  Future<void> saveBoolToSharedPreferencesLow(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('lowBattery', value);
  }

  Future<bool> getBoolFromSharedPreferencesLowBattery() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('lowBattery') ?? false;
  }

  void toggleBoolLow(bool value) {
    setState(() {
      isCheck1 = value;
      if (isCheck1) {
        NotificationService().sendNotification('Full Battery Alarm',
            "App Will Send You Notification When Battery Low.");
      }
      saveBoolToSharedPreferencesLowBattery(value);
    });
  }

  Future<void> loadBoolFromSharedPreferencesLow() async {
    final value = await getBoolFromSharedPreferencesLowBattery();
    setState(() {
      isCheck1 = value;
    });
  }

  Future<void> setSliderValLow(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('lowBatterySlider', value);
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    try {
      if (isRunning) {
        service.invoke("stopService");
      }
      Future.delayed(const Duration(seconds: 3)).then((value) async {
        await initialiseService();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<double> getSliderValLow() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('lowBatterySlider') ?? 0.0;
  }

  Future<void> loadSliderVolume() async {
    final value = await getSliderValLow();
    setState(() {
      _value1 = value;
    });
    if (kDebugMode) {
      print(value.toStringAsFixed(0));
    }
  }

  void toggleSliderLow(double value) {
    setState(() {
      _value1 = value;
      if (kDebugMode) {
        print("${(_value1 * 40).truncate()}");
      }
    });
  }

  Future<void> setSliderVolume(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('volumeAlarm', value);
  }

  Future<double> getSliderVolume() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('volumeAlarm') ?? 70.0;
  }

  Future<void> loadSliderValLow() async {
    final value = await getSliderVolume();
    setState(() {
      volumeSlider = value;
    });
  }

  void toggleSliderVolume(double value) async {
    setState(() {
      volumeSlider = value;
      setSliderVolume(value);
    });
    await advancedPlayer.setVolume(value / 100);
  }

  bool vibration = false;
  Future<void> saveVibration(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('vibrationBattery', value);
  }

  Future<bool> getVibrationBattery() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('vibrationBattery') ?? false;
  }

  void toggleBoolVibration(bool value) {
    setState(() {
      vibration = value;
      Vibration.vibrate();
      saveVibration(value);
    });
  }

  Future<void> loadBoolVibra() async {
    final value = await getVibrationBattery();
    setState(() {
      vibration = value;
    });
  }

  void startBlinking() async {
    int blinkCount = 30;
    for (int i = 0; i < blinkCount; i++) {
      if (kDebugMode) {
        print(blinkCount);
      }
      try {
        await TorchLight.enableTorch();
      } on Exception catch (_) {
        // Handle error
      }
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        await TorchLight.disableTorch();
      } on Exception catch (_) {
        // Handle error
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  void stopBlinking() async {
    TorchLight.disableTorch();
  }

  Future<void> setFlashLight(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('flashLight', value);
  }

  Future<bool> getFlashLight() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('flashLight') ?? false;
  }

  loadFlashLight() async {
    final value = await getFlashLight();
    setState(() {
      isVolumeChk = value;
    });
  }

  void toggleFlashlight(bool value) {
    setState(() {
      isVolumeChk = value;
      setFlashLight(value);
      if (isVolumeChk) {
        TorchLight.enableTorch();
      } else {
        TorchLight.disableTorch();
      }
    });
  }

  Future<void> setFlashSlider(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('flashSlider', value);
  }

  Future<double> getFlashSlider() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('flashSlider') ?? 5.0;
  }

  Future<void> loadFlashSlider() async {
    final value = await getFlashSlider();
    setState(() {
      volumeSlider2 = value;
    });
  }

  void toggleFlashSlider(double value) {
    setState(() {
      volumeSlider2 = value;
      setFlashSlider(value);
    });
  }

  String selectVal = "continues";
  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: AppColors.kBlueLightColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, StateSetter state) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.03,
                    vertical: MediaQuery.sizeOf(context).height * 0.03),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.03),
                      child: const Text(
                        "Flashing Type",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).width * 0.03,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal: MediaQuery.sizeOf(context).width * 0.03),
                      leading: const Text(
                        'Continuous',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      trailing: Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          focusColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          value: "continues",
                          groupValue: selectVal,
                          onChanged: (val) {
                            state(() {
                              selectVal = val.toString();
                            });
                          }),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal: MediaQuery.sizeOf(context).width * 0.03),
                      leading: const Text(
                        'Rhythm',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      trailing: Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          focusColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          value: "rhythm",
                          groupValue: selectVal,
                          onChanged: (val) {
                            state(() {
                              selectVal = val.toString();
                            });
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              height:
                                  MediaQuery.of(context).size.height * 0.044,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                // color: unSelButtonCol,
                                // color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('flashType', selectVal);
                              Get.back();
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                // color: unSelButtonCol,
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  Future<void> getTypeVal() async {
    final prefs = await SharedPreferences.getInstance();
    var val = prefs.getString("flashType") ?? "continues";
    setState(() {
      selectVal = val;
    });
  }
}

class AppBatteryUsage {
  final String appName;
  final bool isSystemApp;
  final double currentEnergyConsumption;

  AppBatteryUsage(
      this.appName, this.isSystemApp, this.currentEnergyConsumption);
}
