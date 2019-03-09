// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agent _$AgentFromJson(Map json) {
  return Agent()
    ..agentNo = json['agent_no'] as String
    ..agentTeamNo = json['team_no'] as String
    ..agentNameEn = json['agent_name_en'] as String
    ..agentNameKh = json['agent_name_kh'] as String
    ..sex = json['sex'] as String
    ..position = json['position'] as String
    ..projectLeadName = json['project_lead_name'] as String
    ..teamLeaderName = json['team_lead_name'] as String
    ..driverName = json['van_driver_name'] as String
    ..driverID = json['van_driver_id'] as String
    ..plaqueNumber = json['van_plaque_number'] as String
    ..idNumber = json['id_number'] as String
    ..personalPhone = json['personal_phone'] as String
    ..masterSim = json['master_sim'] as String
    ..masterSimPwd = json['master_sim_password'] as String
    ..registerSim = json['master_sim_password'] as String
    ..slaveSim = json['slave_sim'] as String
    ..slaveSimPwd = json['slave_sim_password'] as String
    ..entryDate = json['entry_date'] as String
  ;

}

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
      'agent_name_en': instance.agentNameEn,
      'agent_name_kh': instance.agentNameKh,
      'agent_no': instance.agentNo
    };
