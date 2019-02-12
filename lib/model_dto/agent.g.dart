// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agent _$AgentFromJson(Map<String, dynamic> json) {
  return Agent()
    ..agentNameEn = json['agentNameEn'] as String
    ..agentNameKh = json['agentNameKh'] as String
    ..agentNo = json['agentNo'] as String;
}

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
      'agentNameEn': instance.agentNameEn,
      'agentNameKh': instance.agentNameKh,
      'agentNo': instance.agentNo
    };
