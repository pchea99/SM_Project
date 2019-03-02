import 'dart:async';

import 'package:sm_app/model_dao/marketAuditReportDAO.dart';
import 'package:sm_app/network-service/network.dart';

class MarketAuditService{
  static Future insertMarketAudit(MarketAuditReportDAO data){
    var completer = new Completer<String>();
    NetworkService.db.reference()
        .child(NetworkService.marketAuditReportDB)
        .child(data.date)
        .set(data.toJson()).then((_){
      completer.complete("success");
    }).catchError((err){
      completer.complete("failed");
    });

    return completer.future;
  }
}