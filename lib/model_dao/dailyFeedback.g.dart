// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dailyFeedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyFeedback _$DailyFeedbackFromJson(Map<String, dynamic> json) {
  return DailyFeedback()
    ..feedback = json['feedback'] == null
        ? null
        : Feedback.fromJson(json['feedback'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DailyFeedbackToJson(DailyFeedback instance) =>
    <String, dynamic>{'feedback': instance.feedback};
