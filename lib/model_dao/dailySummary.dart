import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/address.dart';
import 'package:sm_app/model_dto/stock.dart';
part 'dailySummary.g.dart';

@JsonSerializable()
class DailySummary{
  String _team;
  DateTime _date;
  Address _address;
  String _agentNo;
  Stock _stock;

  DailySummary();

  factory DailySummary.fromJson(Map<String, dynamic> json) => _$DailySummaryFromJson(json);

  Map<String, dynamic> toJson() => _$DailySummaryToJson(this);

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