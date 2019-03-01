import 'dart:async';

import 'package:sm_app/model_dao/dailyFeedbackDAO.dart';
import 'package:sm_app/network-service/network.dart';

class DailyFeedbackService{
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
}