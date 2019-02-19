import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/select-box.dart';
import 'package:sm_app/utils/select-value.dart';

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

  TextEditingController _controllerTeam;
  TextEditingController _controllerDate;
  TextEditingController _controllerAgentName;
  TextEditingController _controllerSIMDistribution;
  TextEditingController _controllerTopUp;
  TextEditingController _controllerStockInHand;
  TextEditingController _controllerStockTopUp;
  TextEditingController _controllerStockTeamLeader;
  TextEditingController _controllerRemainStock;
  TextEditingController _controllerRemark;

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
        text: formatDate(new DateTime.now(), [yyyy, '-', mm, '-', dd])
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
        title: StringRes.dailyRetailerMapping,
        actions: <Widget>[
          ButtonSave.buttonSave(_onSave)
        ],
        layout: _buildForm()
    );
  }

  SingleChildScrollView _buildForm() {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ContainerForm.buildContainForm(
              Column(
                children: <Widget>[
                  SelectBox.selectBox(
                      radioValue: _radioValueFeedback,
                      onChanged: _handleRadioFeedbackValueChange,
                      label: StringRes.anotherFeedback
                  ),
                  InputField.buildTextField(
                    controller: _controllerTeam,
                    label: StringRes.team,
                  ),
                  InputField.buildTextField(
                      controller: _controllerDate,
                      label: StringRes.date
                  ),
                  SelectValue.selectView(
                      label: StringRes.province,
                      callback: _onSelectProvince
                  ),
                  InputField.buildTextField(
                      controller: _controllerAgentName,
                      label: StringRes.district,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                      controller: _controllerSIMDistribution,
                      label: StringRes.commune,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                      controller: _controllerTopUp,
                      label: StringRes.village,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                      controller: _controllerStockInHand,
                      label: StringRes.latitude
                  ),
                  InputField.buildTextField(
                      controller: _controllerStockTopUp,
                      label: StringRes.longtitude,
                  ),
                  InputField.buildTextField(
                      controller: _controllerStockTeamLeader,
                      label: StringRes.smartCoverageDownload,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                      controller: _controllerRemainStock,
                      label: StringRes.smartCoverageUpload,
                      isEnable: true
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
                      controller: _controllerRemark,
                      label: StringRes.otherIssueRemark,
                      isEnable: true
                  ),
                ],
              )
          ),
        ),
      );
  }

  void _onSelectProvince() {

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

  }
}
