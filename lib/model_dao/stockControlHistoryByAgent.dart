
import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/agent.dart';
import 'package:sm_app/model_dto/stock.dart';
part 'stockControlHistoryByAgent.g.dart';

@JsonSerializable()
class StockControlHistoryByAgent{
  String _team;
  DateTime _date;
  Agent _agent;
  Stock _stock;

  StockControlHistoryByAgent();

  factory StockControlHistoryByAgent.fromJson(Map<String, dynamic> json) => _$StockControlHistoryByAgentFromJson(json);

  Map<String, dynamic> toJson() => _$StockControlHistoryByAgentToJson(this);

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