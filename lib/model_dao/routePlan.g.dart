// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routePlanDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutePlanDAO _$RoutePlanFromJson(Map<String, dynamic> json) {
  return RoutePlanDAO()
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>)
    ..actualVisitVs_Plan = json['actualVisitVs_Plan'] as String
    ..date =
        json['date'] == null ? null : json['date'] as String
    ..team = json['team'] as String;
}

Map<String, dynamic> _$RoutePlanToJson(RoutePlanDAO instance) => <String, dynamic>{
      'address': instance.address,
      'actualVisitVs_Plan': instance.actualVisitVs_Plan,
      'date': instance.date,
      'team': instance.team
    };
