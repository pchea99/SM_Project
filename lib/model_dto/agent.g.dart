// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agent _$AgentFromJson(Map json) {
  return Agent()
    ..agentNameEn = json['agent_name_en'] as String
    ..agentNameKh = json['agent_name_kh'] as String
    ..agentNo = json['agent_no'] as String;
}

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
      'agent_name_en': instance.agentNameEn,
      'agent_name_kh': instance.agentNameKh,
      'agent_no': instance.agentNo
    };
