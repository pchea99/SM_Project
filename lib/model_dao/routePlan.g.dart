// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routePlan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutePlan _$RoutePlanFromJson(Map<String, dynamic> json) {
  return RoutePlan()
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>)
    ..actualVisitVs_Plan = json['actualVisitVs_Plan'] as String
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..team = json['team'] as String;
}

Map<String, dynamic> _$RoutePlanToJson(RoutePlan instance) => <String, dynamic>{
      'address': instance.address,
      'actualVisitVs_Plan': instance.actualVisitVs_Plan,
      'date': instance.date?.toIso8601String(),
      'team': instance.team
    };
