import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:sm_app/model_dao/stockControlHistoryByAgent.dart';
import 'package:sm_app/model_dto/agent.dart';
import 'package:sm_app/model_dto/stock.dart';

class NetworkService{
  static final String dailyDistributionDB = "daily_distribution";
  static final String dailyFeedbacksDB = "daily_feedbacks";
  static final String dailyRetailerMappingDB = "daily_retailer_mapping";
  static final String marketAuditReportDB = "market_audit_report";
  static final String routePlanDB = "route_plan";
  static final String teamInfoDB = "team_info";
  static final String userDB = "user";
  static final String stockControlHistoryByAgentDB = "stock_control_history_by_agent";

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

  static Future getStockByTeamAgent(String teamNo, String agentNo){
    var completer = new Completer<StockControlHistoryByAgentDAO>();
    NetworkService.db.reference()
        .child(NetworkService.stockControlHistoryByAgentDB)
        .orderByChild("team_no").equalTo(teamNo)
        .once().then((snaphot){
      snaphot.value.forEach((key, value){
        StockControlHistoryByAgentDAO stock = StockControlHistoryByAgentDAO.fromJson(value);
        if(stock.agent.agentNo == agentNo) {
          completer.complete(stock);
          return;
        }
      });
    }).catchError((err){
      completer.completeError(err);
    });

    return completer.future;
  }
}