import '../../../battery_alert.dart';

class PowerConsumpCard extends StatelessWidget {
  final String statusText;
  final String hourValue;
  final String minValue;
  final String healthStatus;
  final String temperatureValue;
  final String voltageValue;
  final String capacityValue;
  final String batteryPercentage;

  const PowerConsumpCard(
      {super.key,
      required this.statusText,
      required this.hourValue,
      required this.minValue,
      required this.healthStatus,
      required this.temperatureValue,
      required this.voltageValue,
      required this.capacityValue,
      required this.batteryPercentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),

      decoration: BoxDecoration(
        color: const Color(0xff1C005B),
        boxShadow: [
          AppDecorations.boxShadow,
          AppDecorations.whiteBoxShadow,
        ],
        borderRadius: BorderRadius.circular(30.r),
      ),
      // height: 380,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //*
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/Ellipse 29.png'),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          statusText,
                          style: BTextTheme.lightTextTheme.labelLarge,
                        )
                      ],
                    ),

                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          hourValue,
                          style: BTextTheme.lightTextTheme.headlineMedium,
                        ),
                        Text(
                          '',
                          style: BTextTheme.lightTextTheme.labelLarge,
                        ),
                        Text(
                          minValue,
                          style: BTextTheme.lightTextTheme.headlineMedium,
                        ),
                        // Text(
                        //   'Min',
                        //   style: BTextTheme.lightTextTheme.labelLarge,
                        // ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Left with current ',
                      style: Theme.of(Get.context!).textTheme.bodyMedium,
                    ),
                    Text(
                      'power consumption',
                      style: Theme.of(Get.context!).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/heart.png'),
                        ),
                        Text(
                          healthStatus,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10.w),

                //*Cirrcular
                circularBatteryIndicator(batteryPercentage: batteryPercentage),
              ],
            ),
          ),
          //
          SizedBox(height: 5.h),
          Container(height: 1.0.h, color: Colors.grey.withOpacity(0.6)),
          SizedBox(height: 5.h),

          //*
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textContainer(title: 'Batt.temp', value: capacityValue),
                _textContainer(title: 'Voltage', value: voltageValue),
                _textContainer(title: 'Capacity', value: capacityValue),
              ],
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

//*textContainer
Widget _textContainer({required String title, required String value}) => Column(
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: BTextTheme.lightTextTheme.labelLarge,
        ),
        SizedBox(height: 3.h),
        //TODO
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          decoration: BoxDecoration(
              color: const Color(0xff1C005B),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(0.9),
                    spreadRadius: 0.3.r,
                    blurRadius: 3.r,
                    offset: const Offset(-1 + 1, 1 + -3)),
                BoxShadow(
                    color: Colors.green.withOpacity(0.9),
                    spreadRadius: 2.r,
                    blurRadius: 2.r,
                    offset: const Offset(1 + -1, -1 + 3)),
              ]),
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
