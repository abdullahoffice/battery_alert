
import '../../../battery_alert.dart';

class SetAlarmRingtoneWidget extends StatelessWidget {
  final Function(double)? onVolumeChange;
  final Function(bool)? vibrationChg;
  final Function() audioFileTap;
  final double volumeVal;
  final bool vibrationbool;
  final String audioName;
  final Widget iconwid;
  const SetAlarmRingtoneWidget(
      {super.key,
      required this.onVolumeChange,
      required this.audioFileTap,
      required this.volumeVal,
      required this.vibrationbool,
      required this.vibrationChg,
      required this.iconwid,
      required this.audioName});

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
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Text(
                      "Ringtone",
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
                              color: Colors.white,
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
          const Divider(
            indent: 28,
            endIndent: 180,
            color: Colors.white,
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
                      Icons.speaker,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Text(
                      "Volume",
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
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      child: Slider(
                        activeColor: AppColors.kBlueLightColor,
                        inactiveColor: Colors.white,
                        // thumbColor: Colors.white,
                        min: 10.0,
                        max: 100.0,
                        // value: 0.0,
                        value: volumeVal,
                        onChanged: onVolumeChange,
                        // onChanged: (val) {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            indent: 28,
            endIndent: 180,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.035),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "vibration",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                ),
                Switch(
                  inactiveTrackColor: Colors.black,
                  activeColor: Colors.white,
                  value: vibrationbool,
                  onChanged: vibrationChg,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
