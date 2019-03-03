
import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/agent.dart';
import 'package:sm_app/model_dto/stock.dart';

class StockControlHistoryByAgentDAO{
  String _team;
  DateTime _date;
  Agent _agent;
  Stock _stock;

  StockControlHistoryByAgentDAO();

  StockControlHistoryByAgentDAO.fromJson(Map json) {
    agent.agentNameEn = json['agent_name'];
    agent.agentNo = json['agent_no'];
    date = json['date'];
    stock.remainingStockForTomorrowWorkByAgent =
    json['remaining_stock_for_tomorrow_work_by_agent'];
    stock.simDistribution = json['sim_distribution'];
    stock.stockInHandBeforeTodayWork = json ['stock_in_hand_befor_today_work'];
    stock.stockTeamLeaderTakingBackFromByAgent =
    json['stock_team_leader_taking_back_from_agent'];
    stock.stockTopUpDuringTodayWork = json['stock_top_up_during_today_work'];
    team = json['team_no'];
    stock.topup = json['top_up'];
  }

  Map<String, dynamic> toJson() => {
    'agent_name': agent.agentNameEn,
    'agent_no': agent.agentNo,
    'date': date,
    'remaining_stock_for_tomorrow_work_by_agent': stock
            .remainingStockForTomorrowWorkByAgent,
    'sim_distribution': stock.simDistribution,
    'stock_in_hand_befor_today_work': stock.stockInHandBeforeTodayWork,
    'stock_team_leader_taking_back_from_agent': stock
            .stockTeamLeaderTakingBackFromByAgent,
    'stock_top_up_during_today_work': stock.stockTopUpDuringTodayWork,
    'team_no': team,
    'top_up': stock.topup
  };

  Stock get stock => _stock;

  set stock(Stock value) {
    _stock = value;
  }

  Agent get agent => _agent;

  set agent(Agent value) {
    _agent = value;
  }

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  String get team => _team;

  set team(String value) {
    _team = value;
  }

  @override
  String toString() {
    return 'StockControlHistoryByAgent{_team: $_team, _date: $_date, _agent: $_agent, _stock: $_stock}';
  }

}