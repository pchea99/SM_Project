import 'package:sm_app/model_dto/feedback.dart';
//part 'dailyFeedback.g.dart';

//@JsonSerializable()
class DailyFeedback{
  Feedback _feedback;

  DailyFeedback();

//  factory DailyFeedback.fromJson(Map<String, dynamic> json) => _$DailyFeedbackFromJson(json);

//  Map<String, dynamic> toJson() => _$DailyFeedbackToJson(this);

  Feedback get feedback => _feedback;

  set feedback(Feedback value) {
    _feedback = value;
  }

  @override
  String toString() {
    return 'DailyFeedback{_feedback: $_feedback}';
  }
}