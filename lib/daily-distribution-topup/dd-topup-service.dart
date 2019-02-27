import 'dart:async';

import 'package:sm_app/model_dao/dailyDistributionTopUpDAO.dart';
import 'package:sm_app/network-service/network.dart';

class DDTopUPService{
  static Future insertDDTopUp(DailyDistributionTopUpDAO data){
    var completer = new Completer<String>();
    NetworkService.db.reference()
        .child(NetworkService.dailyDistributionDB)
        .child(data.date)
        .set(data.toJson()).then((_){
          completer.complete("success");
    }).catchError((err){
      completer.complete("failed");
    });

    return completer.future;
  }
}