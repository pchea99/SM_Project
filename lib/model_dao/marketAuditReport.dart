

import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/remark.dart';
part 'marketAuditReport.g.dart';

@JsonSerializable()
class MarketAuditReport{
  String _team;
  DateTime _date;
  Remark _remark;

  MarketAuditReport();

  factory MarketAuditReport.fromJson(Map<String, dynamic> json) => _$MarketAuditReportFromJson(json);

  Map<String, dynamic> toJson() => _$MarketAuditReportToJson(this);

  Remark get remark => _remark;

  set remark(Remark value) {
    _remark = value;
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
    return 'MarketAuditReport{_team: $_team, _date: $_date, _remark: $_remark}';
  }

}