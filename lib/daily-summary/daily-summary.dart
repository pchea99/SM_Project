import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/login/login.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/date-picker.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/input-number.dart';
import 'package:sm_app/utils/select-value.dart';
import 'package:sm_app/utils/string-util.dart';

class DailySummary extends StatefulWidget {
  @override
  _DailySummaryState createState() => _DailySummaryState();
}

class _DailySummaryState extends State<DailySummary> {
  TextEditingController _controllerTeam;
  TextEditingController _controllerAgentNo;
  TextEditingController _controllerProvince;
  TextEditingController _controllerTotalDistribution;
  TextEditingController _controllerTotalTopUp;
  TextEditingController _controllerRemainingStockAtAgent;
  TextEditingController _controllerRemainStockAtTeamLeader;
  DateTime _date;

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _controllerTeam = new TextEditingController(text: sharedUser.teamNo);
    _controllerProvince = new TextEditingController();
    _controllerAgentNo = new TextEditingController();
    _controllerTotalDistribution = new TextEditingController();
    _controllerTotalTopUp = new TextEditingController();
    _controllerRemainingStockAtAgent = new TextEditingController();
    _controllerRemainStockAtTeamLeader = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.dailySummary,
      layout: SingleChildScrollView(
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm(){
    return ContainerForm.buildContainForm(
        Column(
          children: <Widget>[
            DatePicker.datePicker(onSelectedDate),
            InputField.buildTextField(
              controller: _controllerTeam,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerProvince,
                label: StringRes.province
            ),
            InputField.buildTextField(
                controller: _controllerAgentNo,
                label: StringRes.agentNo
            ),
            InputNumber.buildTextField(
                controller: _controllerTotalDistribution,
                label: StringRes.totalDistribution,
            ),
            InputNumber.buildTextField(
                controller: _controllerTotalTopUp,
                label: StringRes.totalTopUp
            ),
            InputNumber.buildTextField(
                controller: _controllerRemainingStockAtAgent,
                label: StringRes.remainingStockAgent
            ),
            InputNumber.buildTextField(
                controller: _controllerRemainStockAtTeamLeader,
                label: StringRes.remainStockTeamLeader,
            ),
          ],
        )
    );
  }

  void _getSummary() {

  }

  void onSelectedDate(value) {
    _date = value;
  }
}
