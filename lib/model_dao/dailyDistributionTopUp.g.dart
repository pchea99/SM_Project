// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dailyDistributionTopUpDAO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyDistributionTopUpDAO _$DailyDistributionTopUpFromJson(Map json) {
  return DailyDistributionTopUpDAO()
    ..stock = json['stock'] == null
        ? null
        : Stock.fromJson(json['stock'] as Map<String, dynamic>)
    ..agent = json['agent'] == null
        ? null
        : Agent.fromJson(json['agent'] as Map<String, dynamic>)
    ..date =
        json['date'] == null ? null : json['date'] as String
    ..team = json['team'] as String
    ..remark = json['remar'] as String
  ;
}

Map<String, dynamic> _$DailyDistributionTopUpToJson(DailyDistributionTopUpDAO instance)
  => <String, dynamic>{
      'agent_name': instance.agent.agentNameEn,
      'agent_no': instance.agent.agentNo,
      'date': instance.date,
      'daily_top_up_amount': instance.stock.topUpAmount,
      'remaining_stock_for_tomorrow_work_by_agent': instance.stock.remainStockForTomorrowWorkAgent,
      'remar': instance.remark,
      'sim_distribution': instance.stock.simDistribution,
      'stock_in_hand_before_today_work': instance.stock.stockInHandBeforeTodayWork,
      'stock_team_leader_taking_back_from_by_agent': instance.stock.stockTeamLeaderTakingBackFromByAgent,
      'stock_top_up_during_today_work': instance.stock.stockTopUpDuringTodayWork,
      'team_no': instance.team,
      'top_up': instance.stock.topup
    };
