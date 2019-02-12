// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dailySummary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailySummary _$DailySummaryFromJson(Map<String, dynamic> json) {
  return DailySummary()
    ..stock = json['stock'] == null
        ? null
        : Stock.fromJson(json['stock'] as Map<String, dynamic>)
    ..agentNo = json['agentNo'] as String
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>)
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..team = json['team'] as String;
}

Map<String, dynamic> _$DailySummaryToJson(DailySummary instance) =>
    <String, dynamic>{
      'stock': instance.stock,
      'agentNo': instance.agentNo,
      'address': instance.address,
      'date': instance.date?.toIso8601String(),
      'team': instance.team
    };
