

import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/remark.dart';
part 'marketAuditReport.g.dart';

@JsonSerializable()
class MarketAuditReportDAO{
  String _team;
  String _date;
  Remark _remark;

  MarketAuditReportDAO(){
    remark = new Remark();
  }

  factory MarketAuditReportDAO.fromJson(Map<String, dynamic> json) => _$MarketAuditReportFromJson(json);

  Map toJson() => {
    'date': date,
    'other_issue': remark.otherIssue,
    'remark_on_agent_performance': remark.agentPerformance,
    'remark_on_system_issues': remark.systemIssue,
    'remark_on_visited_location': remark.visitedLocation,
    'team_no': team
  };

  Remark get remark => _remark;

  set remark(Remark value) {
    _remark = value;
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
    return 'MarketAuditReport{_team: $_team, _date: $_date, _remark: $_remark}';
  }

}