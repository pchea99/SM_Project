// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stockControlReportByTeamLeader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockControlReportByTeamLeader _$StockControlReportByTeamLeaderFromJson(
    Map<String, dynamic> json) {
  return StockControlReportByTeamLeader()
    ..stock = json['stock'] == null
        ? null
        : Stock.fromJson(json['stock'] as Map<String, dynamic>)
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..team = json['team'] as String;
}

Map<String, dynamic> _$StockControlReportByTeamLeaderToJson(
        StockControlReportByTeamLeader instance) =>
    <String, dynamic>{
      'stock': instance.stock,
      'date': instance.date?.toIso8601String(),
      'team': instance.team
    };
