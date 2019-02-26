// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) {
  return Stock()
    ..remainingStockForTomorrowWorkByAgent = (json['remaining_stock_for_tomorrow_work_by_agent'] as num)?.toDouble()
    ..totalRemainStock = (json['totalRemainStock'] as num)?.toDouble()
    ..stockTeamLeaderTakingBackFromByAgent = (json['remainStockTeamLeader'] as num)?.toDouble()
    ..totalTopup = (json['totalTopup'] as num)?.toDouble()
    ..totalDistribution = (json['totalDistribution'] as num)?.toDouble()
    ..remainStockTLFT = (json['remainStockTLFT'] as num)?.toDouble()
    ..totalStockReturnTLBT = (json['totalStockReturnTLBT'] as num)?.toDouble()
    ..totalStockAllocatedTAA =
        (json['totalStockAllocatedTAA'] as num)?.toDouble()
    ..stockDeliveredBTA = (json['stockDeliveredBTA'] as num)?.toDouble()
    ..simStockReceivedBA = (json['simStockReceivedBA'] as num)?.toDouble()
    ..remainStockTLFY = (json['remainStockTLFY'] as num)?.toDouble()
    ..initialStockInHandFTL = (json['initialStockInHandFTL'] as num)?.toDouble()
    ..remainStockForTomorrowWorkAgent = (json['remainStockFTW'] as num)?.toDouble()
    ..stockReturnFromAgentToday =
        (json['stockReturnFromAgentToday'] as num)?.toDouble()
    ..stockTopUpDuringTodayWork = (json['stockTopupDTW'] as num)?.toDouble()
    ..stockInHandBeforeTodayWork = (json['stockInHandBTW'] as num)?.toDouble()
    ..topup = (json['topup'] as num)?.toDouble()
    ..topUpAmount = (json['daily_top_up_amount'] as num)?.toDouble()
    ..simDistribution = (json['simDistribution'] as num)?.toDouble();
}

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'remainStockFTWWA': instance.remainStockFTWWA,
      'totalRemainStock': instance.totalRemainStock,
      'remainStockTeamLeader': instance.stockTeamLeaderTakingBackFromByAgent,
      'remainStockAgent': instance.remainingStockForTomorrowWorkByAgent,
      'totalTopup': instance.totalTopup,
      'totalDistribution': instance.totalDistribution,
      'remainStockTLFT': instance.remainStockTLFT,
      'totalStockReturnTLBT': instance.totalStockReturnTLBT,
      'totalStockAllocatedTAA': instance.totalStockAllocatedTAA,
      'stockDeliveredBTA': instance.stockDeliveredBTA,
      'simStockReceivedBA': instance.simStockReceivedBA,
      'remainStockTLFY': instance.remainStockTLFY,
      'initialStockInHandFTL': instance.initialStockInHandFTL,
      'remainStockFTW': instance.remainStockForTomorrowWorkAgent,
      'stockReturnFromAgentToday': instance.stockReturnFromAgentToday,
      'stockTopupDTW': instance.stockTopUpDuringTodayWork,
      'stockInHandBTW': instance.stockInHandBeforeTodayWork,
      'topup': instance.topup,
      'simDistribution': instance.simDistribution,
      'daily_top_up_amount': instance.topUpAmount
    };
