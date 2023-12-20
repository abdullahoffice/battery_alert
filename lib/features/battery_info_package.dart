import 'package:flutter/material.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';

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
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PowerConsumpCard(
                        statusText: 'Volatege: ${(snapshot.data!.voltage)}',
                        hourValue: '22',
                        powerConsumptionValue: '',
                        healthStatus: 'sno',
                        temperatureValue: '30.4 C ',
                        voltageValue: '4.223 V',
                        capacityValue: '5000mAh',
                        batteryPercentage: '40%',
                      ),
                Text("Voltage: ${(snapshot.data?.voltage)} mV"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    "Charging status: ${(snapshot.data?.chargingStatus.toString().split(".")[1])}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Battery Level: ${(snapshot.data?.batteryLevel)} %"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    "Battery Capacity: ${(snapshot.data!.batteryCapacity! / 1000)} mAh"),
                const SizedBox(
                  height: 20,
                ),
                Text("Technology: ${(snapshot.data?.technology)} "),
                const SizedBox(
                  height: 20,
                ),
                // Text(
                //     "Battery present: ${snapshot.data!.present ? "Yes" : "False"} "),
                // _getChargeTime(snapshot.data),
              ],
            );
          }
        },
      ),
    );
  }

  // Widget _getChargeTime(AndroidBatteryInfo data) {
  //   if (data.chargingStatus == ChargingStatus.Charging) {
  //     return data.chargeTimeRemaining == -1
  //         ? const Text("Calculating charge time remaining")
  //         : Text(
  //             "Charge time remaining: ${(data.chargeTimeRemaining! / 1000 / 60).truncate()} minutes");
  //   }
  //   return const Text("Battery is full or not connected to a power source");
  // }
}
