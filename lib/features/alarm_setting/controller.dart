import 'package:torch_light/torch_light.dart';
import 'package:torch_controller/torch_controller.dart';

import '../../battery_alert.dart';

class AlarmSettingsController extends GetxController {
  TorchController torchController = TorchController();
  static final instance = Get.find<AlarmSettingsController>();

  bool isSwitched = false;

  //*
  double currentSliderValue = 30;
  swithFunc(value) {
    currentSliderValue = value;
  }

  //*AlarmSettingSwitch
  // bool fullBatteryAlarm = false;
  // handleFullBatteryAlarm({required bool value}) {
  //   fullBatteryAlarm = value;
  //   update();
  //   debugPrint('Switch alarm setting value: $fullBatteryAlarm');
  // }

  //*DIRECT SET BOOL VALUE OF ONLY SIWTCH BUTTON
  bool fullBatteryAlarm = false;
  Future<void> setFullBatteryAlarm({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    fullBatteryAlarm = value;
    await prefs.setBool('fullBatteryAlarmValue', value);
    debugPrint('FullBatteryAlarm value: $fullBatteryAlarm');
    update();
  }

  //*DIRECT GET BOOL VALUE OF ONLY SWITCH BUTTON
  Future<void> getFullBatteryAlarm() async {
    final prefs = await SharedPreferences.getInstance();
    var fullBatteryBool = prefs.getBool('fullBatteryAlarmValue') ?? false;
    fullBatteryAlarm = fullBatteryBool;
    update();
    debugPrint('Switch alarm setting value: $fullBatteryAlarm');
  }

  //*FlashLightSwitch
  bool flashLight = false;
  handleFlashlight({required bool value}) {
    flashLight = value;
    if (flashLight) {
      _enableTorch();
    } else {
      _disableTorch();
    }
    update();
    debugPrint('FlashLight: $flashLight');
  }

//   //*....................flash speed
//   bool flashlightEnabled = false;
//   double blinkSpeed = 1.0;
//   Future<void> toggleFlashlight() async {
//     if (!flashlightEnabled) {
//       await TorchLight.enableTorch();
//       startBlinking();
//     } else {
//       await TorchLight.disableTorch();
//       stopBlinking();
//     }
//     flashlightEnabled = !flashlightEnabled;
//     update();
//   }

//   void startBlinking() {
//     Timer.periodic(Duration(seconds: blinkSpeed.toInt()), (timer) {
//       if (flashlightEnabled) {
//         torchController.toggle();
//       } else {
//         timer.cancel();
//       }
//     });
//   }

//   // Then, use the stored instance to cancel the timer:
//   Timer? blinkingTimer;
//   void stopBlinking() {
//     if (blinkingTimer != null) {
//       blinkingTimer!.cancel();
//       blinkingTimer = null;
//     }
//   }

//   Future<void> loadBlinkSpeed() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (prefs.containsKey('blinkSpeed')) {
//       blinkSpeed = prefs.getDouble('blinkSpeed') ?? 1.0;
//       update();
//     }
//   }

//   Future<void> saveBlinkSpeed() async {
//     final prefs = await SharedPreferences.getInstance();
//     double blinkSpeedd = double.parse(blinkSpeed.toString());
//     await prefs.setDouble('blinkSpeed', blinkSpeedd);
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     loadBlinkSpeed();
//   }

// // Updates blinkSpeed and saves it to SharedPreferences when the slider value changes
//   void updateBlinkSpeed(double value) {
//     if (value >= 0.1 && value <= 2.0) {
//       blinkSpeed = value;
//       update();
//     }
//     saveBlinkSpeed();
//   }
  //*....................

  //*AlarmSettingSwitch
  bool lowBatteryAlarm = false;
  handleLowBatteryAlarm({required bool value}) {
    lowBatteryAlarm = value;
    update();
    debugPrint('Switch alarm setting value: $lowBatteryAlarm');
  }

  //*RingTone Selection
  String? selectedRingtone;
  String? selectedRingtoneName;
  Future<void> pickRingtone() async {
    String? filePath = await FilePicker.platform
        .pickFiles(
          type: FileType.audio,
          allowMultiple: false,
        )
        .then((result) => result?.files.single.path);

    if (filePath != null) {
      final fileName = File(filePath).path.split('/').last;
      selectedRingtoneName = fileName;
      selectedRingtone = filePath;
      update();
    }
  }

  // Play Ringtone
  final _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Future<void> playRingtone() async {
    try {
      if (selectedRingtone == null) {
        throw Exception('No ringtone selected');
      }

      await _audioPlayer.setFilePath(selectedRingtone!);
      await _audioPlayer.play();

      debugPrint('isPLaying: $isPlaying');
      isPlaying = true;
      update();
    } catch (e) {
      debugPrint('Error playing ringtone: $e');
    }
  }

  // Stop ringtone
  void stopRingtone() async {
    try {
      await _audioPlayer.stop();
      debugPrint('isPLaying: $isPlaying');
      isPlaying = false;
      update();
    } catch (e) {
      debugPrint('Error stopping ringtone: $e');
    }
  }

  // Volume slider
  RxDouble volume = 50.0.obs;

  void setVolume(double value) {
    volume.value = value;
    update();
    debugPrint('Volume set to: $value');
    if (_audioPlayer.playing) {
      _audioPlayer.setVolume(value / 100);
    }
  }

  // @override
  // void dispose() {
  //   _audioPlayer.dispose();
  //   super.dispose();
  // }

  @override
  void dispose() {
    // _audioPlayer.dispose();
    _audioPlayer.stop();
    // Get.delete<AlarmSettingsController>();
    super.dispose();
  }

  // @override
  // void onClose() {
  //   stopRingtone();
  //   super.onClose();
  // }

  Future<void> _enableTorch() async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      Fluttertoast.showToast(msg: 'Could not enable torch');
    }
  }

  Future<void> _disableTorch() async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      Fluttertoast.showToast(msg: 'Could not disable torch');
    }
  }
}












/**void main() {
  String dest = 'Pak';
  double weight = 20;
  
  if(dest == 'XYZ'){
    print('${weight * 10}');
  }else if(dest == 'YYY'){
    print('${weight * 5}');
  }else if(dest == 'Pak'){
    print('${weight * 2}');
  }else {
    print('Error');
  }
  
  switch(dest){
    case 'XVR' :
        print('${weight * 10}');
    case 'Pak':
        print('${weight * 1}');
      case '222':
        print('${weight * 1}');
      default :
      print('ERROR');
  }
}
 */
