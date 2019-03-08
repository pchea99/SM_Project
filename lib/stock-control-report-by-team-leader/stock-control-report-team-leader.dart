import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/input-number.dart';
import 'package:sm_app/utils/string-util.dart';

class StockControlReportByTeamLeader extends StatefulWidget {
  @override
  _StockControlReportByTeamLeaderState createState() => _StockControlReportByTeamLeaderState();
}

class _StockControlReportByTeamLeaderState extends State<StockControlReportByTeamLeader> {
  TextEditingController _controllerTeam;
  TextEditingController _controllerDate;
  TextEditingController _controllerInitialStockInHandForTeamLeader;
  TextEditingController _controllerRemainingStockAtTeamLeaderFromYesterday;
  TextEditingController _controllerSIMStockReceivedByAssistant;
  TextEditingController _controllerStockDeliveredBackToAssistant;
  TextEditingController _controllerTotalStockAllocatedToAllAgent;
  TextEditingController _controllerTotalStockTeamLeaderTakingBackToday;
  TextEditingController _controllerRemainingStockAtTeamLeaderForToday;

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
      title: StringRes.stockControlReportTeamLeader,
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
            InputField.buildTextField(
              controller: _controllerTeam,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerDate,
                label: StringRes.date
            ),
            InputField.buildTextField(
                controller: _controllerInitialStockInHandForTeamLeader,
                label: StringRes.initialStock
            ),
            InputField.buildTextField(
                controller: _controllerRemainingStockAtTeamLeaderFromYesterday,
                label: StringRes.remainingStockTeamLeadYesterday
            ),
            InputNumber.buildTextField(
                controller: _controllerSIMStockReceivedByAssistant,
                label: StringRes.simStockReceivedAssistant,
                isEnable: true
            ),
            InputNumber.buildTextField(
                controller: _controllerStockDeliveredBackToAssistant,
                label: StringRes.stockDeliveryBackAssistant,
                isEnable: true
            ),
            InputNumber.buildTextField(
                controller: _controllerTotalStockAllocatedToAllAgent,
                label: StringRes.totalStockAllocate
            ),
            InputNumber.buildTextField(
                controller: _controllerTotalStockTeamLeaderTakingBackToday,
                label: StringRes.totalStockTeamLeadTakingBackToday,
            ),
            InputNumber.buildTextField(
                controller: _controllerRemainingStockAtTeamLeaderForToday,
                label: StringRes.remainingStockTeamLeaderToday,
            ),
          ],
        )
    );
  }

  void _onSave() {

  }


}
