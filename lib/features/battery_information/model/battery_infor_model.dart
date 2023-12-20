// ignore_for_file: public_member_api_docs, sort_constructors_first
class BatteryInforModel {
  String title;
  String subTitle;
  String icon;
  BatteryInforModel({
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  void updateSubTitle(String newSubTitle) {
    subTitle = newSubTitle;
  }
}
