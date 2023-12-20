import '../../battery_alert.dart';

class ChargerTestingController extends GetxController {
  static final instance = Get.find<ChargerTestingController>();

  List<CharTestingModel> charTestingData = [
    CharTestingModel(valueText: 'Min Value', value: '00 mA'),
    CharTestingModel(valueText: 'Current', value: '00 mA'),
    CharTestingModel(valueText: 'Max Value', value: '00 mA'),
  ];
}
