import '../../../battery_alert.dart';

class BatteryInfoWidget extends StatefulWidget {
  const BatteryInfoWidget({
    super.key,
  });

  @override
  State<BatteryInfoWidget> createState() => _BatteryInfoWidgetState();
}

class _BatteryInfoWidgetState extends State<BatteryInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: StreamBuilder(
        stream: BatteryInfoPlugin().androidBatteryInfoStream,
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          String? healthStatus = snapshot.data?.health!.split('_').last;
          // var data = snapshot.data!.chargingStatus.toString();
          if (snapshot.hasData) {
            var info = DeviceInfoPlugin().androidInfo;
            // info.battery.
            // print(data);
            AndroidBatteryInfo batteryInfo = AndroidBatteryInfo();
            return PowerConsumpCard(
              statusText:
                  AppScreenUtils.getChargingStatus(snapshot.data?.chargingStatus),
              hourValue: snapshot.data!.batteryLevel == 100
                  ? 'Full'
                  : '${(snapshot.data!.chargeTimeRemaining! / 1000 / 60 / 60).truncate()}h ',
              minValue: snapshot.data!.batteryLevel == 100
                  ? ''
                  : '${(snapshot.data!.chargeTimeRemaining! / 1000 / 60 % 60).truncate()}m',
              healthStatus: "$healthStatus",
              temperatureValue: '${(snapshot.data!.temperature!)} °C',
              voltageValue: '${(snapshot.data?.voltage)! / 1000} mV',
              capacityValue:
                  '${int.parse((snapshot.data!.batteryCapacity! / 1000).toStringAsFixed(0))} mAh',
              batteryPercentage: '${(snapshot.data?.batteryLevel)} %',
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
