import '../../../battery_alert.dart';

Widget adsBoxWidget({required double height}) => Container(
      height: height,
      width: 154.w,
      decoration: BoxDecoration(
        color: const Color(0xff1C005B),
        borderRadius: BorderRadius.circular(20),
        boxShadow:  [
         AppDecorations.smallboxShadow,
         AppDecorations.smallWhiteBoxShadow,
        ],
      ),
      child: const Center(
        child: Text(
          'ADs',
          style: TextStyle(
            fontSize: 54.38,
            fontWeight: FontWeight.w400,
            color: Colors.green,
          ),
        ),
      ),
    );
