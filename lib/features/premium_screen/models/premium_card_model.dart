// ignore_for_file: public_member_api_docs, sort_constructors_first
class PremiumModel {
  final String timePeriod;
  final String payFor;
  final String price;
  final String type;
  PremiumModel(
    this.type, {
    required this.timePeriod,
    required this.payFor,
    required this.price,
  });
}
