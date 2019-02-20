import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
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
  TextEditingController _controllerDate;
  TextEditingController _controllerAgentNo;
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
    _controllerDate = new TextEditingController(
        text: formatDate(new DateTime.now(), StringUtil.dateFormats())
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.dailySummary,
      actions: <Widget>[
        ButtonSave.buttonSave(_onSave)
      ],
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
                controller: _controllerAgentName,
                label: StringRes.province
            ),
            InputField.buildTextField(
                controller: _controllerAgentName,
                label: StringRes.agentNo
            ),
            InputNumber.buildTextField(
                controller: _controllerSIMDistribution,
                label: StringRes.totalDistribution,
            ),
            InputNumber.buildTextField(
                controller: _controllerTopUp,
                label: StringRes.totalTopUp
            ),
            InputNumber.buildTextField(
                controller: _controllerStockInHand,
                label: StringRes.remainingStockAgent
            ),
            InputNumber.buildTextField(
                controller: _controllerStockTopUp,
                label: StringRes.remainStockTeamLeader,
            ),
          ],
        )
    );
  }

  void _onSave() {

  }

  void onSelectedDate(value) {

  }
}
