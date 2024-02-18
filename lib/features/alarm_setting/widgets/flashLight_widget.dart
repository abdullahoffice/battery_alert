// import 'package:batteryanimation/utils/colors.dart';
// import 'package:flutter/material.dart';

import '../../../battery_alert.dart';

class SetFlashLightWidget extends StatelessWidget {
  final Function(double)? onVolumeChange;
  final Function(bool)? vibrationChg;
  final Function() audioFileTap;
  final double volumeVal;
  final bool vibrationbool;
  final String audioName;
  final Widget iconwid;
  final String flashCount;
  final Widget dropButton;
  const SetFlashLightWidget(
      {super.key,
      required this.onVolumeChange,
      required this.audioFileTap,
      required this.volumeVal,
      required this.vibrationbool,
      required this.vibrationChg,
      required this.iconwid,
      required this.dropButton,
      required this.flashCount,
      required this.audioName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.white54),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.add_alert,
                      color: Colors.transparent,
                      size: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Text(
                      "Flashlight",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: audioFileTap,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.23,
                        child: Text(
                          audioName,
                          // "Mi Remix",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.transparent,
                              fontSize:
                                  MediaQuery.sizeOf(context).height * 0.017,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                    iconwid,
                  ],
                )
              ],
            ),
          ),
          Divider(
            indent: 28,
            endIndent: 180,
            color: Colors.white,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.speaker,
                      color: Colors.transparent,
                      size: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Text(
                      "Flashing Type",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    dropButton,
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          Divider(
            indent: 28,
            endIndent: 180,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                Text(
                  "Flash Speed",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: Slider(
                    divisions: 2,
                    activeColor: AppColors.kBlueLightColor,
                    inactiveColor: Colors.white,
                    // thumbColor: Colors.white,
                    min: 5.0,
                    max: 10.0,
                    // value: 0.0,
                    value: volumeVal,
                    onChanged: onVolumeChange,
                    // onChanged: (val) {},
                  ),
                ),
                Text(
                  flashCount,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
