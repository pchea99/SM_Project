import 'dart:async';

import 'package:sm_app/model_dao/dailyDistributionTopUp.dart';
import 'package:sm_app/network-service/network.dart';

class DDTopUPService{
  Future insertDDTopUp(DailyDistributionTopUp data){
    var completer = new Completer<String>();
    NetworkService.db.reference()
        .child(NetworkService.dailyDistributionDB)
        .set(data.toJson()).then((_){
          completer.complete("success");
    }).catchError((err){
      completer.complete("failed");
    });

    return completer.future;
  }
}