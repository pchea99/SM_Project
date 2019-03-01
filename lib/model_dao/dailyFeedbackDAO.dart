import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/feedback.dart';
part 'dailyFeedback.g.dart';

@JsonSerializable()
class DailyFeedbackDAO{
  Feedback _feedback;

  DailyFeedbackDAO();

  factory DailyFeedbackDAO.fromJson(Map<String, dynamic> json) => _$DailyFeedbackFromJson(json);

  Feedback get feedback => _feedback;

  set feedback(Feedback value) {
    _feedback = value;
  }

  toJson(){
    return{
      'another_retailer': feedback.anotherFeedback,
      'broken_app': feedback.brokenApp,
      'broken_phone': feedback.brokenPhone,
      'commune': feedback.address.commune,
      'date': feedback.date,
      'district': feedback.address.district,
      'issue': feedback.issue,
      'latitude': feedback.gps.latitude,
      'longtitude': feedback.gps.longtitude,
      'no_coverage': feedback.noCoverage,
      'no_people': feedback.noPeople,
      'other_issue_remark': feedback.otherIssueRemark,
      'over_visited': feedback.overVisited,
      'province': feedback.address.province,
      'slow_phone': feedback.slowPhone,
      'smart_coverage_download': feedback.smartCoverageDownload,
      'smart_coverage_upload': feedback.smartCoverageUpload,
      'team_no': feedback.team,
      'unrecognized_sim': feedback.unrecognizedSIM,
      'village': feedback.address.village,
      'weather': feedback.weather
    };
  }

  @override
  String toString() {
    return 'DailyFeedback{_feedback: $_feedback}';
  }
}