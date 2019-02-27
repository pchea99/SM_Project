import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/agent.dart';
import 'package:sm_app/model_dto/stock.dart';
part 'dailyDistributionTopUp.g.dart';

@JsonSerializable()
class DailyDistributionTopUpDAO{
  String _team;
  String _date;
  String _remark;
  Agent _agent;
  Stock _stock;

  DailyDistributionTopUpDAO(){
    agent = new Agent();
    stock = new Stock();
  }

  factory DailyDistributionTopUpDAO.fromJson(Map<String, dynamic> json)
          => _$DailyDistributionTopUpFromJson(json);

  Map<String, dynamic> toJson() => _$DailyDistributionTopUpToJson(this);

  String get remark => _remark;

  set remark(String value) {
    _remark = value;
  }

  Stock get stock => _stock;

  set stock(Stock value) {
    _stock = value;
  }

  Agent get agent => _agent;

  set agent(Agent value) {
    _agent = value;
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
    return 'DailyDistributionTopUp{_team: $_team, _date: $_date, _agent: $_agent, _stock: $_stock}';
    }
}