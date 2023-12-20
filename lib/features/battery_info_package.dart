import 'package:battery_info/enums/charging_status.dart';

import '../battery_alert.dart';

class BaterryInfo extends StatefulWidget {
  const BaterryInfo({super.key});

  @override
  State<BaterryInfo> createState() => _BaterryInfoState();
}

class _BaterryInfoState extends State<BaterryInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: StreamBuilder<AndroidBatteryInfo?>(
        stream: BatteryInfoPlugin().androidBatteryInfoStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // var chargeTimeRemaining;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PowerConsumpCard(
                  statusText: '${(snapshot.data?.pluggedStatus)} %',
                  hourValue:
                      '${(snapshot.data?.chargeTimeRemaining)} ', //* Incomplete
                  minValue:
                      '${(snapshot.data!.chargeTimeRemaining! / 1000 / 60).truncate()} minutes',
                  healthStatus: '${(snapshot.data!.health)}',
                  temperatureValue: '${(snapshot.data!.temperature)} C',
                  voltageValue: '${(snapshot.data?.voltage)} mV',
                  capacityValue: '${(snapshot.data?.batteryCapacity)} mAh',
                  batteryPercentage: '${(snapshot.data?.batteryLevel)} %',
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _getChargeTime(AndroidBatteryInfo data) {
    if (data.chargingStatus == ChargingStatus.Charging) {
      return data.chargeTimeRemaining == -1
          ? const Text("Calculating charge time remaining")
          : Text(
              "Charge time remaining: ${(data.chargeTimeRemaining! / 1000 / 60).truncate()} minutes");
    }
    return const Text("Battery is full or not connected to a power source");
  }
}
