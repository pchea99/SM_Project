import 'package:sm_app/model_dto/address.dart';
import 'package:sm_app/model_dto/gps.dart';

class Feedback{
  String _anotherFeedback;
  String _team;
  DateTime _date;
  Address _address;
  Gps _gps;
  double _smartCoverageDownload;
  double _smartCoverageUpload;
  String _issue;
  double _brokenPhone;
  double _slowPhone;
  double _brokenApp;
  String _noCoverage;
  double _unrecognizedSIM;
  String _weather;
  String _noPeople;
  String _overVisited;
  String _otherIssueRemark;

  Feedback(
      this._anotherFeedback,
      this._team,
      this._date,
      this._address,
      this._gps,
      this._smartCoverageDownload,
      this._smartCoverageUpload,
      this._issue,
      this._brokenPhone,
      this._slowPhone,
      this._brokenApp,
      this._noCoverage,
      this._unrecognizedSIM,
      this._weather,
      this._noPeople,
      this._overVisited,
      this._otherIssueRemark
      );

  String get otherIssueRemark => _otherIssueRemark;

  set otherIssueRemark(String value) {
    _otherIssueRemark = value;
  }

  String get overVisited => _overVisited;

  set overVisited(String value) {
    _overVisited = value;
  }

  String get noPeople => _noPeople;

  set noPeople(String value) {
    _noPeople = value;
  }

  String get weather => _weather;

  set weather(String value) {
    _weather = value;
  }

  double get unrecognizedSIM => _unrecognizedSIM;

  set unrecognizedSIM(double value) {
    _unrecognizedSIM = value;
  }

  String get noCoverage => _noCoverage;

  set noCoverage(String value) {
    _noCoverage = value;
  }

  double get brokenApp => _brokenApp;

  set brokenApp(double value) {
    _brokenApp = value;
  }

  double get slowPhone => _slowPhone;

  set slowPhone(double value) {
    _slowPhone = value;
  }

  double get brokenPhone => _brokenPhone;

  set brokenPhone(double value) {
    _brokenPhone = value;
  }

  String get issue => _issue;

  set issue(String value) {
    _issue = value;
  }

  double get smartCoverageUpload => _smartCoverageUpload;

  set smartCoverageUpload(double value) {
    _smartCoverageUpload = value;
  }

  double get smartCoverageDownload => _smartCoverageDownload;

  set smartCoverageDownload(double value) {
    _smartCoverageDownload = value;
  }

  Gps get gps => _gps;

  set gps(Gps value) {
    _gps = value;
  }

  Address get address => _address;

  set address(Address value) {
    _address = value;
  }

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  String get team => _team;

  set team(String value) {
    _team = value;
  }

  String get anotherFeedback => _anotherFeedback;

  set anotherFeedback(String value) {
    _anotherFeedback = value;
  }

  @override
  String toString() {
    return 'Feedback{_anotherFeedback: $_anotherFeedback, _team: $_team, _date: $_date, _address: $_address, _gps: $_gps, _smartCoverageDownload: $_smartCoverageDownload, _smartCoverageUpload: $_smartCoverageUpload, _issue: $_issue, _brokenPhone: $_brokenPhone, _slowPhone: $_slowPhone, _brokenApp: $_brokenApp, _noCoverage: $_noCoverage, _unrecognizedSIM: $_unrecognizedSIM, _weather: $_weather, _noPeople: $_noPeople, _overVisited: $_overVisited, _otherIssueRemark: $_otherIssueRemark}';
  }
}