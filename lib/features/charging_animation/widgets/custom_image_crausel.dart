import '../../../battery_alert.dart';

class CustomBatteryInfoWidget extends StatelessWidget {
  final String customImageData;
  final double customTop;
  final double customRight;
  final double customLeft;

  const CustomBatteryInfoWidget({
    required this.customImageData,
    required this.customTop,
    required this.customRight,
    required this.customLeft,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (_) {
        return StreamBuilder(
          stream: BatteryInfoPlugin().androidBatteryInfoStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.asset(
                        customImageData.isNotEmpty
                            ? customImageData
                            : AppGifs.animationOne,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: customTop,
                    right: customRight,
                    left: customLeft,
                    child: Text(
                      '${(snapshot.data?.batteryLevel)} %',
                      style: BTextTheme.lightTextTheme.headlineLarge,
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
