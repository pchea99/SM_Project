import 'dart:async';

import 'package:sm_app/model_dao/dailyRetailerMappingDAO.dart';
import 'package:sm_app/network-service/network.dart';

class DRMappingService{
  static Future insertDRMapping(DailyRetailerMappingDAO data){
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
}