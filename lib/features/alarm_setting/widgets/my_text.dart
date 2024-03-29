import '../../../battery_alert.dart';

class MyText extends StatelessWidget {
  var text,
      color,
      weight,
      family,
      align,
      spacing,
      decoration,
      maxlines,
      overFlow;
  double? size;

  MyText(
      {Key? key,
      required this.text,
      this.color,
      this.weight,
      this.family,
      this.size,
      this.spacing,
      this.align,
      this.decoration,
      this.overFlow,
      this.maxlines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxlines,
      style: TextStyle(
          overflow: overFlow ?? TextOverflow.ellipsis,
          decoration: decoration,
          letterSpacing: spacing,
          // color: color,
          color: Colors.white,
          fontSize: MediaQuery.sizeOf(context).height * 0.02,
          fontFamily: family,
          fontWeight: weight),
    );
  }
}
