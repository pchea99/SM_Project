import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class NetworkService{
  static final String dailyDistributionDB = "daily_distribution";
  static final String dailyFeedbacksDB = "daily_feedbacks";
  static final String dailyRetailerMappingDB = "daily_retailer_mapping";
  static final String marketAuditReportDB = "market_audit_report";
  static final String routePlanDB = "route_plan";
  static final String teamInfoDB = "team_info";

  static final DatabaseReference db = FirebaseDatabase.instance.reference();

  static Future getAgent(){
    var completer = new Completer<String>();
    NetworkService.db.reference()
        .child(NetworkService.teamInfoDB).once().then((snaphot){
          print("ooooo ${snaphot}");
//          completer.complete("success");
        }).catchError((err){
          completer.complete("failed");
        });

    return completer.future;
  }
}