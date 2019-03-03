import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:sm_app/model_dto/agent.dart';

class NetworkService{
  static final String dailyDistributionDB = "daily_distribution";
  static final String dailyFeedbacksDB = "daily_feedbacks";
  static final String dailyRetailerMappingDB = "daily_retailer_mapping";
  static final String marketAuditReportDB = "market_audit_report";
  static final String routePlanDB = "route_plan";
  static final String teamInfoDB = "team_info";
  static final String userDB = "user";


  static final DatabaseReference db = FirebaseDatabase.instance.reference();

  static Future getAgent(String teamNo){
    var completer = new Completer<List<Agent>>();
    NetworkService.db.reference()
        .child(NetworkService.teamInfoDB).orderByChild("team_no").equalTo(teamNo)
        .once().then((snaphot){
          List<Agent> agents = [];
          snaphot.value.forEach((key, value){
            Agent agent = Agent.fromJson(value);
            agents.add(agent);
          });
          completer.complete(agents);
        }).catchError((err){
          completer.completeError(err);
        });

    return completer.future;
  }

  static Future getStock(){
    var completer = new Completer<List>();
    NetworkService.db.reference()
        .child(NetworkService.teamInfoDB).once().then((snaphot){
      List agents = [];
      snaphot.value.forEach((key, value){
        Agent agent = Agent.fromJson(value);
        agents.add(agent);
      });
      completer.complete(agents);
    }).catchError((err){
      completer.completeError(err);
    });

    return completer.future;
  }
}