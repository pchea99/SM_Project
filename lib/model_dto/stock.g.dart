// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) {
  return Stock()
    ..remainStockFTWWA = (json['remainStockFTWWA'] as num)?.toDouble()
    ..totalRemainStock = (json['totalRemainStock'] as num)?.toDouble()
    ..remainStockTeamLeader = (json['remainStockTeamLeader'] as num)?.toDouble()
    ..remainStockAgent = (json['remainStockAgent'] as num)?.toDouble()
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
    ..remainStockFTW = (json['remainStockFTW'] as num)?.toDouble()
    ..stockReturnFromAgentToday =
        (json['stockReturnFromAgentToday'] as num)?.toDouble()
    ..stockTopupDTW = (json['stockTopupDTW'] as num)?.toDouble()
    ..stockInHandBTW = (json['stockInHandBTW'] as num)?.toDouble()
    ..topup = (json['topup'] as num)?.toDouble()
    ..simDistribution = (json['simDistribution'] as num)?.toDouble();
}

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'remainStockFTWWA': instance.remainStockFTWWA,
      'totalRemainStock': instance.totalRemainStock,
      'remainStockTeamLeader': instance.remainStockTeamLeader,
      'remainStockAgent': instance.remainStockAgent,
      'totalTopup': instance.totalTopup,
      'totalDistribution': instance.totalDistribution,
      'remainStockTLFT': instance.remainStockTLFT,
      'totalStockReturnTLBT': instance.totalStockReturnTLBT,
      'totalStockAllocatedTAA': instance.totalStockAllocatedTAA,
      'stockDeliveredBTA': instance.stockDeliveredBTA,
      'simStockReceivedBA': instance.simStockReceivedBA,
      'remainStockTLFY': instance.remainStockTLFY,
      'initialStockInHandFTL': instance.initialStockInHandFTL,
      'remainStockFTW': instance.remainStockFTW,
      'stockReturnFromAgentToday': instance.stockReturnFromAgentToday,
      'stockTopupDTW': instance.stockTopupDTW,
      'stockInHandBTW': instance.stockInHandBTW,
      'topup': instance.topup,
      'simDistribution': instance.simDistribution
    };
