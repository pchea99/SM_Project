import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/stock.dart';
//part 'stockControlReportByTeamLeader.g.dart';

//@JsonSerializable()
class StockControlReportByTeamLeader{
  String _team;
  DateTime _date;
  Stock _stock;

  StockControlReportByTeamLeader();

//  factory StockControlReportByTeamLeader.fromJson(Map<String, dynamic> json) => _$StockControlReportByTeamLeaderFromJson(json);

//  Map<String, dynamic> toJson() => _$StockControlReportByTeamLeaderToJson(this);

  Stock get stock => _stock;

  set stock(Stock value) {
    _stock = value;
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
    return 'StockControlReportByTeamLeader{_team: $_team, _date: $_date, _stock: $_stock}';
  }

}