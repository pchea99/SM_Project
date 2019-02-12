// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teamInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamInfo _$TeamInfoFromJson(Map<String, dynamic> json) {
  return TeamInfo()
    ..entryDate = json['entryDate'] == null
        ? null
        : DateTime.parse(json['entryDate'] as String)
    ..sim = json['sim'] == null
        ? null
        : Sim.fromJson(json['sim'] as Map<String, dynamic>)
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..agent = json['agent'] == null
        ? null
        : Agent.fromJson(json['agent'] as Map<String, dynamic>)
    ..van = json['van'] == null
        ? null
        : Van.fromJson(json['van'] as Map<String, dynamic>)
    ..teamLeaderName = json['teamLeaderName'] as String
    ..projectLeadName = json['projectLeadName'] as String
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..team = json['team'] as String;
}

Map<String, dynamic> _$TeamInfoToJson(TeamInfo instance) => <String, dynamic>{
      'entryDate': instance.entryDate?.toIso8601String(),
      'sim': instance.sim,
      'user': instance.user,
      'agent': instance.agent,
      'van': instance.van,
      'teamLeaderName': instance.teamLeaderName,
      'projectLeadName': instance.projectLeadName,
      'date': instance.date?.toIso8601String(),
      'team': instance.team
    };
