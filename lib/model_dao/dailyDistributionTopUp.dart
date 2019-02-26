import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/agent.dart';
import 'package:sm_app/model_dto/stock.dart';
part 'dailyDistributionTopUp.g.dart';

@JsonSerializable()
class DailyDistributionTopUp{
  String _team;
  DateTime _date;
  String _remark;
  Agent _agent;
  Stock _stock;

  DailyDistributionTopUp();

  factory DailyDistributionTopUp.fromJson(Map<String, dynamic> json) => _$DailyDistributionTopUpFromJson(json);

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
    return 'DailyDistributionTopUp{_team: $_team, _date: $_date, _agent: $_agent, _stock: $_stock}';
    }
}