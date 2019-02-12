import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/address.dart';
part 'routePlan.g.dart';

@JsonSerializable()
class RoutePlan{
  String _team;
  DateTime _date;
  String _actualVisitVs_Plan;
  Address _address;

  RoutePlan();

  factory RoutePlan.fromJson(Map<String, dynamic> json) => _$RoutePlanFromJson(json);

  Map<String, dynamic> toJson() => _$RoutePlanToJson(this);

  Address get address => _address;

  set address(Address value) {
    _address = value;
  }

  String get actualVisitVs_Plan => _actualVisitVs_Plan;

  set actualVisitVs_Plan(String value) {
    _actualVisitVs_Plan = value;
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
    return 'RoutePlan{_team: $_team, _date: $_date, _actualVisitVs_Plan: $_actualVisitVs_Plan, _address: $_address}';
  }

}