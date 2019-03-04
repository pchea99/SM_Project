import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/address.dart';
import 'package:sm_app/model_dto/stock.dart';

class DailySummaryDAO{
  String _team;
  DateTime _date;
  Address _address;
  String _agentNo;
  Stock _stock;

  DailySummaryDAO();

  DailySummaryDAO.fromJson(Map json) {
    agentNo = json['agent_no'];
    date = json['date'];
    address.province = json['province'];
    stock.remainStockAgent = json['remaining_stocks_at_agent'];
    stock.remainStockTeamLeader = json['remaining_stocks_at_team_leader'];
    team = json['team_no'];
    stock.totalDistribution = json['total_distribution'];
    stock.totalTopup = json['total_top_up'];
  }

  Map<String, dynamic> toJson() =>
      {
        'agent_no': agentNo,
        'date': date,
        'province': address.province,
        'remaining_stocks_at_agent': stock.remainStockAgent,
        'remaining_stocks_at_team_leader': stock.remainStockTeamLeader,
        'team_no': team,
        'total_distribution': stock.totalDistribution,
        'total_top_up': stock.totalTopup
      };

  Stock get stock => _stock;

  set stock(Stock value) {
    _stock = value;
  }

  String get agentNo => _agentNo;

  set agentNo(String value) {
    _agentNo = value;
  }

  Address get address => _address;

  set address(Address value) {
    _address = value;
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
    return 'DailySummary{_team: $_team, _date: $_date, _address: $_address, _agentNo: $_agentNo, _stock: $_stock}';
  }

}