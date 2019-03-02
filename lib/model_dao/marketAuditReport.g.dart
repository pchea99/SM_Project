// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketAuditReportDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketAuditReportDAO _$MarketAuditReportFromJson(Map<String, dynamic> json) {
  return MarketAuditReportDAO()
    ..remark = json['remark'] == null
        ? null
        : Remark.fromJson(json['remark'] as Map<String, dynamic>)
    ..date =
        json['date'] == null ? null : json['date'] as String
    ..team = json['team'] as String;
}

Map<String, dynamic> _$MarketAuditReportToJson(MarketAuditReportDAO instance) =>
    <String, dynamic>{
      'remark': instance.remark,
      'date': instance.date,
      'team': instance.team
    };
