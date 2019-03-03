
import 'package:json_annotation/json_annotation.dart';
part 'stock.g.dart';

@JsonSerializable()
class Stock{
  double _simDistribution;
  double _topup;
  double _stockInHandBeforetodayWork;
  double _stockTopUpDuringTodayWork;
  double _stockTeamLeaderTakingBackFromByAgent;
  double _remainStockFTW;
  double _initialStockInHandFTL;
  double _remainStockTLFY;
  double _simStockReceivedBA;
  double _stockDeliveredBTA;
  double _totalStockAllocatedTAA;
  double _totalStockReturnTLBT;
  double _remainStockTLFT;
  double _totalDistribution;
  double _totalTopup;
  double _remainStockAgent;
  double _remainStockTeamLeader;
  double _totalRemainStock;
  double _remainingStockForTomorrowWorkByAgent;
  double _topUpAmount;

  Stock();

  double get topUpAmount => _topUpAmount;

  set topUpAmount(double value) {
    _topUpAmount = value;
  }

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  Map<String, dynamic> toJson() => _$StockToJson(this);

  double get remainStockFTWWA => _remainingStockForTomorrowWorkByAgent;

  set remainStockFTWWA(double value) {
    _remainingStockForTomorrowWorkByAgent = value;
  }

  double get totalRemainStock => _totalRemainStock;

  set totalRemainStock(double value) {
    _totalRemainStock = value;
  }

  double get stockTeamLeaderTakingBackFromByAgent => _remainStockTeamLeader;

  set stockTeamLeaderTakingBackFromByAgent(double value) {
    _remainStockTeamLeader = value;
  }

  double get remainingStockForTomorrowWorkByAgent => _remainStockAgent;

  set remainingStockForTomorrowWorkByAgent(double value) {
    _remainStockAgent = value;
  }

  double get totalTopup => _totalTopup;

  set totalTopup(double value) {
    _totalTopup = value;
  }

  double get totalDistribution => _totalDistribution;

  set totalDistribution(double value) {
    _totalDistribution = value;
  }

  double get remainStockTLFT => _remainStockTLFT;

  set remainStockTLFT(double value) {
    _remainStockTLFT = value;
  }

  double get totalStockReturnTLBT => _totalStockReturnTLBT;

  set totalStockReturnTLBT(double value) {
    _totalStockReturnTLBT = value;
  }

  double get totalStockAllocatedTAA => _totalStockAllocatedTAA;

  set totalStockAllocatedTAA(double value) {
    _totalStockAllocatedTAA = value;
  }

  double get stockDeliveredBTA => _stockDeliveredBTA;

  set stockDeliveredBTA(double value) {
    _stockDeliveredBTA = value;
  }

  double get simStockReceivedBA => _simStockReceivedBA;

  set simStockReceivedBA(double value) {
    _simStockReceivedBA = value;
  }

  double get remainStockTLFY => _remainStockTLFY;

  set remainStockTLFY(double value) {
    _remainStockTLFY = value;
  }

  double get initialStockInHandFTL => _initialStockInHandFTL;

  set initialStockInHandFTL(double value) {
    _initialStockInHandFTL = value;
  }

  double get remainStockForTomorrowWorkAgent => _remainStockFTW;

  set remainStockForTomorrowWorkAgent(double value) {
    _remainStockFTW = value;
  }

  double get stockReturnFromAgentToday => _stockTeamLeaderTakingBackFromByAgent;

  set stockReturnFromAgentToday(double value) {
    _stockTeamLeaderTakingBackFromByAgent = value;
  }

  double get stockTopUpDuringTodayWork => _stockTopUpDuringTodayWork;

  set stockTopUpDuringTodayWork(double value) {
    _stockTopUpDuringTodayWork = value;
  }

  double get stockInHandBeforeTodayWork => _stockInHandBeforetodayWork;

  set stockInHandBeforeTodayWork(double value) {
    _stockInHandBeforetodayWork = value;
  }

  double get topup => _topup;

  set topup(double value) {
    _topup = value;
  }

  double get simDistribution => _simDistribution;

  set simDistribution(double value) {
    _simDistribution = value;
  }

  @override
  String toString() {
    return 'Stock{_simDistribution: $_simDistribution, _topup: $_topup, _stockInHandBTW: $_stockInHandBeforetodayWork, _stockTopupDTW: $_stockTopUpDuringTodayWork, _stockReturnFromAgentToday: $_stockTeamLeaderTakingBackFromByAgent, _remainStockFTW: $_remainStockFTW, _initialStockInHandFTL: $_initialStockInHandFTL, _remainStockTLFY: $_remainStockTLFY, _simStockReceivedBA: $_simStockReceivedBA, _stockDeliveredBTA: $_stockDeliveredBTA, _totalStockAllocatedTAA: $_totalStockAllocatedTAA, _totalStockReturnTLBT: $_totalStockReturnTLBT, _remainStockTLFT: $_remainStockTLFT, _totalDistribution: $_totalDistribution, _totalTopup: $_totalTopup, _remainStockAgent: $_remainStockAgent, _remainStockTeamLeader: $_remainStockTeamLeader, _totalRemainStock: $_totalRemainStock, _remainStockFTWWA: $_remainingStockForTomorrowWorkByAgent}';
  }
}