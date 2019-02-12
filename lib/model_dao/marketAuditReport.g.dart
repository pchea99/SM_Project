// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketAuditReport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketAuditReport _$MarketAuditReportFromJson(Map<String, dynamic> json) {
  return MarketAuditReport()
    ..remark = json['remark'] == null
        ? null
        : Remark.fromJson(json['remark'] as Map<String, dynamic>)
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..team = json['team'] as String;
}

Map<String, dynamic> _$MarketAuditReportToJson(MarketAuditReport instance) =>
    <String, dynamic>{
      'remark': instance.remark,
      'date': instance.date?.toIso8601String(),
      'team': instance.team
    };
