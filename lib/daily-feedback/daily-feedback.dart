import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/daily-feedback/daily-feedback-service.dart';
import 'package:sm_app/list-view/list-view-province.dart';
import 'package:sm_app/model_dao/dailyFeedbackDAO.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/navigate-to.dart';
import 'package:sm_app/utils/select-box.dart';
import 'package:sm_app/utils/select-value.dart';
import 'package:sm_app/utils/spinner-dialog.dart';
import 'package:sm_app/utils/string-util.dart';

class DailyFeedback extends StatefulWidget {
  @override
  _DailyFeedbackState createState() => _DailyFeedbackState();
}

class _DailyFeedbackState extends State<DailyFeedback> {
  int _radioValueFeedback;
  int _radioValueIssue;
  int _radioValueBrokenPhone;
  int _radioValueSlowPhone;
  int _radioValueBrokenApp;
  int _radioValueNoCoverage;
  int _radioValueUnrecognizeSIM;
  int _radioValueWeather;
  int _radioValueNoPeople;
  int _radioValueOverVisited;

  TextEditingController _controllerTeamNo;
  TextEditingController _controllerDate;
  TextEditingController _controllerDistrict;
  TextEditingController _controllerCommune;
  TextEditingController _controllerVillage;
  TextEditingController _controllerSmartDownload;
  TextEditingController _controllerSmartUpload;
  TextEditingController _controllerAnotherIssue;
  TextEditingController _controllerLatitude;
  TextEditingController _controllerLongtitude;

  String _txtProvince;
  String _date;

  @override
  void initState() {
    super.initState();
    _radioValueFeedback = 0;
    _radioValueIssue = 0;
    _radioValueBrokenPhone = 0;
    _radioValueSlowPhone = 0;
    _radioValueBrokenApp = 0;
    _radioValueNoCoverage = 0;
    _radioValueUnrecognizeSIM = 0;
    _radioValueWeather = 0;
    _radioValueNoPeople = 0;
    _radioValueOverVisited = 0;

    _controllerDate = new TextEditingController(
        text: formatDate(new DateTime.now(), StringUtil.dateFormats())
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
        title: StringRes.dailyFeedback,
        actions: <Widget>[
          ButtonSave.buttonSave(_onSave)
        ],
        layout: _buildForm()
    );
  }

  SingleChildScrollView _buildForm() {
    return SingleChildScrollView(
        child: ContainerForm.buildContainForm(
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SelectValue.selectView(
                    label: StringRes.province,
                    callback: _onSelectProvince,
                    value: _txtProvince,
                  ),
                ),
                InputField.buildTextField(
                  controller: _controllerTeamNo,
                  label: StringRes.team,
                ),
                InputField.buildTextField(
                    controller: _controllerDate,
                    label: StringRes.date
                ),
                InputField.buildTextField(
                    controller: _controllerDistrict,
                    label: StringRes.district,
                    isEnable: true
                ),
                InputField.buildTextField(
                    controller: _controllerCommune,
                    label: StringRes.commune,
                    isEnable: true
                ),
                InputField.buildTextField(
                    controller: _controllerVillage,
                    label: StringRes.village,
                    isEnable: true
                ),
                InputField.buildTextField(
                    controller: _controllerAnotherIssue,
                    label: StringRes.smartCoverageDownload,
                    isEnable: true
                ),
                InputField.buildTextField(
                    controller: _controllerAnotherFeedback,
                    label: StringRes.smartCoverageUpload,
                    isEnable: true
                ),
                InputField.buildTextField(
                    controller: _controllerIssue,
                    label: StringRes.otherIssueRemark,
                    isEnable: true
                ),
                SelectBox.selectBox(
                    radioValue: _radioValueFeedback,
                    onChanged: _handleRadioFeedbackValueChange,
                    label: StringRes.anotherFeedback
                ),
                SelectBox.selectBox(
                    radioValue: _radioValueIssue,
                    onChanged: _handleRadioIssueValueChange,
                    label: StringRes.issue
                ),
                SelectBox.selectBox(
                    radioValue: _radioValueBrokenPhone,
                    onChanged: _handleRadioBrokenPhoneValueChange,
                    label: StringRes.brokenPhone
                ),
                SelectBox.selectBox(
                    radioValue: _radioValueSlowPhone,
                    onChanged: _handleRadioSlowPhoneValueChange,
                    label: StringRes.slowPhone
                ),
                SelectBox.selectBox(
                    radioValue: _radioValueBrokenApp,
                    onChanged: _handleRadioBrokenAppValueChange,
                    label: StringRes.brokenApp
                ),
                SelectBox.selectBox(
                    radioValue: _radioValueNoCoverage,
                    onChanged: _handleRadioNoCoverageValueChange,
                    label: StringRes.noCoverage
                ),
                SelectBox.selectBox(
                    radioValue: _radioValueUnrecognizeSIM,
                    onChanged: _handleRadioUnrecognizeSIMValueChange,
                    label: StringRes.unrecognizedSIM
                ),
                SelectBox.selectBox(
                    radioValue: _radioValueWeather,
                    onChanged: _handleRadioWeatherValueChange,
                    label: StringRes.weather
                ),
                SelectBox.selectBox(
                    radioValue: _radioValueNoPeople,
                    onChanged: _handleRadioNoPeopleValueChange,
                    label: StringRes.noPeople
                ),
                SelectBox.selectBox(
                    radioValue: _radioValueOverVisited,
                    onChanged: _handleRadioOverVisitValueChange,
                    label: StringRes.overVisited
                ),
                InputField.buildTextField(
                    controller: _controllerSmartDownload,
                    label: StringRes.latitude
                ),
                InputField.buildTextField(
                  controller: _controllerSmartUpload,
                  label: StringRes.longtitude,
                ),
              ],
            )
        ),
      );
  }

  void _onSelectProvince() async {
    var callback = await NavigateTo.navigateTo(context: context, route: ListViewProvince());
    if(callback != null){
      _txtProvince = callback;
      _onSetState();
    }
  }
  void _handleRadioFeedbackValueChange(int value) {
    _radioValueFeedback = value;
    _onSetState();
  }

  void _handleRadioIssueValueChange(int value) {
    _radioValueIssue = value;
    _onSetState();
  }

  void _handleRadioBrokenPhoneValueChange(int value) {
    _radioValueBrokenPhone = value;
    _onSetState();
  }

  void _handleRadioSlowPhoneValueChange(int value) {
    _radioValueSlowPhone = value;
    _onSetState();
  }

  void _handleRadioBrokenAppValueChange(int value) {
    _radioValueBrokenApp = value;
    _onSetState();
  }

  void _handleRadioNoCoverageValueChange(int value) {
    _radioValueNoCoverage = value;
    _onSetState();
  }

  void _handleRadioUnrecognizeSIMValueChange(int value) {
    _radioValueUnrecognizeSIM = value;
    _onSetState();
  }

  void _handleRadioWeatherValueChange(int value) {
    _radioValueWeather = value;
    _onSetState();
  }

  void _handleRadioNoPeopleValueChange(int value) {
    _radioValueNoPeople = value;
    _onSetState();
  }

  void _handleRadioOverVisitValueChange(int value) {
    _radioValueOverVisited = value;
    _onSetState();
  }

  void _onSetState(){
    if(!mounted){
      return;
    }

    setState(() {});
  }

  void _onSave() {
    SpinnerDialog.onSpinner(context);
//    _date = DateFormat('dd-MM-yyyy hh:mm:ss').add_j().format(DateTime.now());

    DailyFeedbackDAO data = new DailyFeedbackDAO()
      ..feedback.address.province = _txtProvince
      ..feedback.team = _controllerTeamNo.text
      ..feedback.date = _date
      ..feedback.address.district = _controllerDistrict.text
      ..feedback.address.commune = _controllerCommune.text
      ..feedback.address.village = _controllerVillage.text
      ..feedback.smartCoverageDownload = double.parse(_controllerSmartDownload.text)
      ..feedback.smartCoverageUpload = double.parse(_controllerSmartUpload.text)
      ..feedback.anotherFeedback = _controllerAnotherIssue.text
      ..feedback.issue = _radioValueIssue == 0 ? 'yes' : 'no'
      ..feedback.anotherFeedback = _radioValueFeedback == 0 ? 'yes' : 'no'
      ..feedback.brokenPhone = _radioValueBrokenPhone == 0 ? 'yes' : 'no'
      ..feedback.slowPhone = _radioValueSlowPhone == 0 ? 'yes' : 'no'
      ..feedback.brokenApp = _radioValueBrokenApp == 0 ? 'yes' : 'no'
      ..feedback.noCoverage = _radioValueNoCoverage == 0 ? 'yes' : 'no'
      ..feedback.unrecognizedSIM = _radioValueUnrecognizeSIM == 0 ? 'yes' : 'no'
      ..feedback.weather = _radioValueWeather == 0 ? 'yes' : 'no'
      ..feedback.noPeople = _radioValueNoPeople == 0 ? 'yes' : 'no'
      ..feedback.overVisited = _radioValueOverVisited == 0 ? 'yes' : 'no'
      ..feedback.gps.latitude = _controllerLatitude.text
      ..feedback.gps.longtitude = _controllerLongtitude.text
    ;

    DailyFeedbackService.insertDailyFeedback(data).then((value){
      Navigator.pop(context);
    }).catchError((err){
      Navigator.pop(context);
    });
  }
}
