// ignore_for_file: must_be_immutable

// import 'package:batteryanimation/utils/colors.dart';
// import 'package:batteryanimation/widgets/mytext.dart';
// import 'package:flutter/material.dart';

import '../../../battery_alert.dart';

class AlarmSettingsWidget extends StatelessWidget {
  final bool value;
  void Function(bool)? onChangedSwitch;
  final double valueSlider;
  void Function(double)? onChangedSlider;
  void Function(double)? onEndSlider;
  final String percentageVal;
  final String notifyText;
  final String stringText;
  final Color textColor;
  final double min;
  final double max;

  AlarmSettingsWidget(
      {super.key,
      required this.value,
      required this.onChangedSwitch,
      required this.valueSlider,
      required this.onChangedSlider,
      required this.percentageVal,
      required this.notifyText,
      required this.stringText,
      required this.textColor,
      required this.min,
      required this.max,
      required this.onEndSlider});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBlueColor,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.white54),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stringText,
                      style: BTextTheme.lightTextTheme.headlineSmall,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).height * 0.23,
                      child: Text(
                        notifyText,
                        style: BTextTheme.lightTextTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
                Switch(
                  inactiveTrackColor: Colors.black,
                  activeColor: Colors.white,
                  value: value,
                  onChanged: onChangedSwitch,
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.02),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.backgroundColor),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              child: MyText(
                text: stringText,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.02,
                vertical: MediaQuery.sizeOf(context).height * 0.01),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    onChangeEnd: onEndSlider,
                    activeColor: AppColors.kBlueLightColor,
                    inactiveColor: Colors.white,
                    // min: 0.0,
                    min: min,
                    max: max,
                    // max: 1.0,
                    value: valueSlider,
                    onChanged: onChangedSlider,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: MyText(text: "$percentageVal%"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
