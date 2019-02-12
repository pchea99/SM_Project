import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/agent.dart';
import 'package:sm_app/model_dto/sim.dart';
import 'package:sm_app/model_dto/user.dart';
import 'package:sm_app/model_dto/van.dart';
part 'teamInfo.g.dart';

@JsonSerializable()
class TeamInfo{
  String _team;
  DateTime _date;
  String _projectLeadName;
  String _teamLeaderName;
  Van _van;
  Agent _agent;
  User _user;
  Sim _sim;
  DateTime _entryDate;

  TeamInfo();

  factory TeamInfo.fromJson(Map<String, dynamic> json) => _$TeamInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TeamInfoToJson(this);

  DateTime get entryDate => _entryDate;

  set entryDate(DateTime value) {
    _entryDate = value;
  }

  Sim get sim => _sim;

  set sim(Sim value) {
    _sim = value;
  }

  User get user => _user;

  set user(User value) {
    _user = value;
  }

  Agent get agent => _agent;

  set agent(Agent value) {
    _agent = value;
  }

  Van get van => _van;

  set van(Van value) {
    _van = value;
  }

  String get teamLeaderName => _teamLeaderName;

  set teamLeaderName(String value) {
    _teamLeaderName = value;
  }

  String get projectLeadName => _projectLeadName;

  set projectLeadName(String value) {
    _projectLeadName = value;
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
    return 'TeamInfo{_team: $_team, _date: $_date, _projectLeadName: $_projectLeadName, _teamLeaderName: $_teamLeaderName, _van: $_van, _agent: $_agent, _user: $_user, _sim: $_sim, _entryDate: $_entryDate}';
  }

}