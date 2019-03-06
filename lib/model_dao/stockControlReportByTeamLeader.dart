import 'package:sm_app/model_dto/stock.dart';

class StockControlReportByTeamLeader{
  String _team;
  String _date;
  Stock _stock;

  StockControlReportByTeamLeader(){
    stock = new Stock();
  }

  StockControlReportByTeamLeader.fromJson(Map json){
    team = json['team_no'];
    date = json['date'];
    stock.initialStockInHandForTeamLeader = json['initial_stock_in_hand_for_team_leader'];
    stock.remainStockTeamLeaderFromYesterday = json['reamining_stock_at_team_leader_from_yesterday'];
    stock.simStockReceivedByAssistant = json['sim_stock_received_by_assistant'];
    stock.stockDeliveredBackToAssistant = json['stock_delivered_back_to_assistant'];
    stock.totalStockAllocatedToAllAgent = json['total_stock_allocated_to_all_agent'];
    stock.totalStockReturnTeamLeaderTakingBackToday = json['total_stock_team_leader_taking_back_today'];
    stock.remainStockTeamLeaderForToday = json['remaining_stock_at_team_leader_for_today'];
  }

  Map toJson() => {
    'team_no': team,
    'date': date,
    'initial_stock_in_hand_for_team_leader': stock.initialStockInHandForTeamLeader,
    'reamining_stock_at_team_leader_from_yesterday': stock.remainStockTeamLeaderFromYesterday,
    'sim_stock_received_by_assistant': stock.simStockReceivedByAssistant,
    'stock_delivered_back_to_assistant': stock.stockDeliveredBackToAssistant,
    'total_stock_allocated_to_all_agent': stock.totalStockAllocatedToAllAgent,
    'total_stock_team_leader_taking_back_today': stock.totalStockReturnTeamLeaderTakingBackToday,
    'remaining_stock_at_team_leader_for_today': stock.remainStockTeamLeaderForToday
  };

  Stock get stock => _stock;

  set stock(Stock value) {
    _stock = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get team => _team;

  set team(String value) {
    _team = value;
  }

  @override
  String toString() {
    return 'StockControlReportByTeamLeader{_team: $_team, _date: $_date, _stock: $_stock}';
  }

}