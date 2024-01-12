import '../../../battery_alert.dart';

class ChargeHistoryContainer extends GetView<ChargingHistoryController> {
  const ChargeHistoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChargingHistoryController>(
      initState: (state) async {
        BatteryInfoHandler.instance.startListening();
      },
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.historyList.length,
                    itemBuilder: (context, index) {
                      final historyItem = controller.historyList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: ChargingHistoryItemWidget(
                          chargedFor: historyItem.title ?? 'Default Title',
                          percentTitle:
                              historyItem.percentTitle ?? 'Percent Title',
                          plugIn: historyItem.plugIn ?? 'Plug In',
                          time: historyItem.time ?? 'Time',
                          date: historyItem.date ?? 'Date',
                          plugOut: historyItem.plugOut ?? 'Plug Out',
                          time2: historyItem.time2 ?? 'Time2',
                          date2: historyItem.date2 ?? 'Date2',
                          startPercentage: historyItem.startPercentage ?? '%',
                          endPercentage: historyItem.endPercentage ?? '%',
                        ),
                      );
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: BatteryInfoHandler.instance.clearChargingHistory,
                child: const Text('clear'),
              ),
            ],
          ),
        );
      },
    );
  }
}
