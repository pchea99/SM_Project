import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:sm_app/model_dao/dailyDistributionTopUpDAO.dart';
import 'package:sm_app/model_dao/dailyFeedbackDAO.dart';
import 'package:sm_app/model_dao/dailyRetailerMappingDAO.dart';
import 'package:sm_app/model_dao/dailySummaryDAO.dart';
import 'package:sm_app/model_dao/stockControlHistoryByAgentDAO.dart';
import 'package:sm_app/model_dao/stockControlReportByTeamLeaderDAO.dart';
import 'package:sm_app/model_dto/agent.dart';

class NetworkService{
  static final String dailyDistributionDB = "daily_distribution";
  static final String dailyFeedbacksDB = "daily_feedbacks";
  static final String dailyRetailerMappingDB = "daily_retailer_mapping";
  static final String marketAuditReportDB = "market_audit_report";
  static final String routePlanDB = "route_plan";
  static final String teamInfoDB = "team_info";
  static final String userDB = "user";
  static final String dailySummaryDB = "daily_summary";
  static final String stockControlHistoryByAgentDB = "stock_control_history_by_agent";
  static final String stockControlReportByTeamLeaderDB = "stock_control_report_by_team_leader";

  static final DatabaseReference db = FirebaseDatabase.instance.reference();

  static Future getTeamInfo(String teamNo){
    var completer = new Completer<List<Agent>>();
    NetworkService.db.reference()
        .child(NetworkService.teamInfoDB).orderByChild("team_no").equalTo(teamNo)
        .once().then((snaphot){
          List<Agent> agents = [];
          snaphot.value.forEach((key, value){
            Agent agent = Agent.fromJson(value);
            agents.add(agent);
            print("===network=== : $agent");
          });
          completer.complete(agents);
        }).catchError((err){
          completer.completeError(err);
        });

    return completer.future;
  }

  static Future getStockByTeamAgent(String date, String teamNo, String agentNo){
    var completer = new Completer<StockControlHistoryByAgentDAO>();
    NetworkService.db.reference()
        .child(NetworkService.stockControlHistoryByAgentDB)
        .orderByChild("date").equalTo(date)
        .once().then((snaphot){
          if(snaphot != null && snaphot.value != null) {
            snaphot.value.forEach((key, value) {
              StockControlHistoryByAgentDAO stock = StockControlHistoryByAgentDAO
                  .fromJson(value);
              if (stock.agent.agentNo == agentNo && stock.team == teamNo) {
                completer.complete(stock);
                return;
              }
            });
          }
    }).catchError((err){
      completer.completeError(err);
    });

    return completer.future;
  }

  static Future getStockControlReportTeamLeader(String date, String teamNo){
    var completer = new Completer<StockControlReportByTeamLeaderDAO>();
    NetworkService.db.reference()
        .child(NetworkService.stockControlReportByTeamLeaderDB)
        .orderByChild("date").equalTo(date)
        .once().then((snaphot){
      if(snaphot != null && snaphot.value != null) {
        snaphot.value.forEach((key, value) {
          StockControlReportByTeamLeaderDAO stock = StockControlReportByTeamLeaderDAO.fromJson(value);
          if (stock.team == teamNo) {
            completer.complete(stock);
            return;
          }
        });
      }
    }).catchError((err){
      completer.completeError(err);
    });

    return completer.future;
  }

  static Future getSummaryByDateTeamAgent(String date, String teamNo, String agentNo){
    var completer = new Completer<DailySummaryDAO>();
    NetworkService.db.reference()
        .child(NetworkService.dailySummaryDB)
        .orderByChild("date").equalTo(date)
        .once().then((snaphot) {
      if (snaphot.value == null) {
        completer.complete(null);
        return;
      }

      Map json = new Map.from(snaphot.value);
      DailySummaryDAO summaryDAO = DailySummaryDAO.fromJson(json.values.first);
      completer.complete(summaryDAO);
    }).catchError((err){
      completer.completeError(err);
    });

    return completer.future;
  }

  static Future getSummaryByTeam(String date, String teamNo){
    var completer = new Completer<DailySummaryDAO>();
    NetworkService.db.reference()
        .child(NetworkService.dailySummaryDB)
        .orderByChild("date").equalTo(date)
        .once().then((snaphot) {
      if (snaphot.value == null) {
        completer.complete(null);
        return;
      }
      Map json = new Map.from(snaphot.value);
      DailySummaryDAO summaryDAO = DailySummaryDAO.fromJson(json.values.first);
      completer.complete(summaryDAO);
    }).catchError((err){
      completer.completeError(err);
    });

    return completer.future;
  }

  static Future insertDailyDistributionTopUp(DailyDistributionTopUpDAO data){
    var completer = new Completer<String>();
    NetworkService.db.reference()
        .child(NetworkService.dailyDistributionDB)
        .child(data.date +"-"+ data.team +"-"+ data.agent.agentNo)
        .set(data.toJson()).then((_){
      completer.complete("success");
    }).catchError((err){
      completer.complete("failed");
    });

    return completer.future;
  }

  static Future insertStockHistoryByAgent(StockControlHistoryByAgentDAO data){
    var completer = new Completer<String>();
    NetworkService.db.reference()
        .child(NetworkService.stockControlHistoryByAgentDB)
        .child(data.date +"-"+ data.team +"-"+ data.agent.agentNo)
        .set(data.toJson()).then((_){
      completer.complete("success");
    }).catchError((err){
      completer.complete("failed");
    });

    return completer.future;
  }

  static Future insertDailySummary(DailySummaryDAO data){
    var completer = new Completer<String>();
    NetworkService.db.reference()
        .child(NetworkService.dailySummaryDB)
        .child(data.date)
        .set(data.toJson()).then((_){
      completer.complete("success");
    }).catchError((err){
      completer.complete("failed");
    });

    return completer.future;
  }

  static Future insertDailyFeedback(DailyFeedbackDAO data){
    var completer = new Completer<String>();
    NetworkService.db.reference()
        .child(NetworkService.dailyFeedbacksDB)
        .child(data.feedback.date)
        .set(data.toJson()).then((_){
      completer.complete("success");
    }).catchError((err){
      completer.complete("failed");
    });

    return completer.future;
  }

  static Future insertDailyRetailerMapping(DailyRetailerMappingDAO data){
    var completer = new Completer<String>();
    NetworkService.db.reference()
        .child(NetworkService.dailyRetailerMappingDB)
        .child(data.date)
        .set(data.toJson()).then((_){
      completer.complete("success");
    }).catchError((err){
      completer.complete("failed");
    });

    return completer.future;
  }

  static Future insertStockControlReportByTeamLeader(StockControlReportByTeamLeaderDAO data){
    var completer = new Completer<String>();
    NetworkService.db.reference()
        .child(NetworkService.stockControlReportByTeamLeaderDB)
        .child(data.date)
        .set(data.toJson()).then((_){
      completer.complete("success");
    }).catchError((err){
      completer.complete("failed");
    });

    return completer.future;
  }
}