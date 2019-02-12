// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dailyDistributionTopUp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyDistributionTopUp _$DailyDistributionTopUpFromJson(
    Map<String, dynamic> json) {
  return DailyDistributionTopUp()
    ..stock = json['stock'] == null
        ? null
        : Stock.fromJson(json['stock'] as Map<String, dynamic>)
    ..agent = json['agent'] == null
        ? null
        : Agent.fromJson(json['agent'] as Map<String, dynamic>)
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..team = json['team'] as String;
}

Map<String, dynamic> _$DailyDistributionTopUpToJson(
        DailyDistributionTopUp instance) =>
    <String, dynamic>{
      'stock': instance.stock,
      'agent': instance.agent,
      'date': instance.date?.toIso8601String(),
      'team': instance.team
    };
