// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../battery_alert.dart';

class ChargingHistoryModel {
  final String? title;//
  final String? percentTitle;//
  final String? plugIn;
  final String? time;//
  final String? date;//
  final String? plugOut;
  final String? time2;//
  final String? date2;//
  final String? startPercentage;// 
  final String? endPercentage;//
  ChargingHistoryModel({
    this.title,
    this.percentTitle,
    this.plugIn,
    this.time,
    this.date,
    this.plugOut,
    this.time2,
    this.date2,
    this.startPercentage,
    this.endPercentage,
  });

  ChargingHistoryModel copyWith({
    String? title,
    String? percentTitle,
    String? plugIn,
    String? time,
    String? date,
    String? plugOut,
    String? time2,
    String? date2,
    String? startPercentage,
    String? endPercentage,
  }) {
    return ChargingHistoryModel(
      title: title ?? this.title,
      percentTitle: percentTitle ?? this.percentTitle,
      plugIn: plugIn ?? this.plugIn,
      time: time ?? this.time,
      date: date ?? this.date,
      plugOut: plugOut ?? this.plugOut,
      time2: time2 ?? this.time2,
      date2: date2 ?? this.date2,
      startPercentage: startPercentage ?? this.startPercentage,
      endPercentage: endPercentage ?? this.endPercentage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'percentTitle': percentTitle,
      'plugIn': plugIn,
      'time': time,
      'date': date,
      'plugOut': plugOut,
      'time2': time2,
      'date2': date2,
      'startPercentage': startPercentage,
      'endPercentage': endPercentage,
    };
  }

  factory ChargingHistoryModel.fromMap(Map<String, dynamic> map) {
    return ChargingHistoryModel(
      title: map['title'] != null ? map['title'] as String : null,
      percentTitle: map['percentTitle'] != null ? map['percentTitle'] as String : null,
      plugIn: map['plugIn'] != null ? map['plugIn'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      plugOut: map['plugOut'] != null ? map['plugOut'] as String : null,
      time2: map['time2'] != null ? map['time2'] as String : null,
      date2: map['date2'] != null ? map['date2'] as String : null,
      startPercentage: map['startPercentage'] != null ? map['startPercentage'] as String : null,
      endPercentage: map['endPercentage'] != null ? map['endPercentage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChargingHistoryModel.fromJson(String source) => ChargingHistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChargingHistoryModel(title: $title, percentTitle: $percentTitle, plugIn: $plugIn, time: $time, date: $date, plugOut: $plugOut, time2: $time2, date2: $date2, startPercentage: $startPercentage, endPercentage: $endPercentage)';
  }

  @override
  bool operator ==(covariant ChargingHistoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.percentTitle == percentTitle &&
      other.plugIn == plugIn &&
      other.time == time &&
      other.date == date &&
      other.plugOut == plugOut &&
      other.time2 == time2 &&
      other.date2 == date2 &&
      other.startPercentage == startPercentage &&
      other.endPercentage == endPercentage;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      percentTitle.hashCode ^
      plugIn.hashCode ^
      time.hashCode ^
      date.hashCode ^
      plugOut.hashCode ^
      time2.hashCode ^
      date2.hashCode ^
      startPercentage.hashCode ^
      endPercentage.hashCode;
  }
}
