// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dailyFeedbackDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyFeedbackDAO _$DailyFeedbackFromJson(Map<String, dynamic> json) {
  return DailyFeedbackDAO()
    ..feedback = json['feedback'] == null
        ? null
        : Feedback.fromJson(json['feedback'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DailyFeedbackToJson(DailyFeedbackDAO instance) =>
    <String, dynamic>{'feedback': instance.feedback};
