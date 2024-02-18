import '../../../battery_alert.dart';

class ChargeHistoryContainer extends GetView<ChargingHistoryController> {
  const ChargeHistoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChargingHistoryController>(
      initState: (state) async {
        // TODO: c
        // BatteryInfoHandler.instance.startListening();
        ChargingHistoryController.instance.startListening();
      },
      builder: (context) {
        return SingleChildScrollView(
          child: FutureBuilder(
              future: controller.getCharhistory(),
              builder: (context, snapshot) {
                if (controller.historyList.isEmpty) {
                  return const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Center(
                      child: ChargingHistoryItemWidget(
                        chargedFor: 'Default Title',
                        percentTitle: 'Percent Title',
                        plugIn: 'Plug In',
                        time: 'Time',
                        date: 'Date',
                        plugOut: 'Plug Out',
                        time2: 'Time2',
                        date2: 'Date2',
                        startPercentage: '%',
                        endPercentage: '%',
                      ),
                    ),
                  );
                } else {
                  return Column(
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
                              startPercentage:
                                  historyItem.startPercentage ?? '%',
                              endPercentage: historyItem.endPercentage ?? '%',
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
              }),
        );
      },
    );
  }
}
