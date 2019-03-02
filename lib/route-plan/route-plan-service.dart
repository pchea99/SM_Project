import 'dart:async';

import 'package:sm_app/model_dao/routePlanDAO.dart';
import 'package:sm_app/network-service/network.dart';

class RoutePlanService{
  static Future insertRoutePlan(RoutePlanDAO data){
    var completer = new Completer<String>();
    NetworkService.db.reference()
        .child(NetworkService.routePlanDB)
        .child(data.date)
        .set(data.toJson()).then((_){
      completer.complete("success");
    }).catchError((err){
      completer.complete("failed");
    });

    return completer.future;
  }
}