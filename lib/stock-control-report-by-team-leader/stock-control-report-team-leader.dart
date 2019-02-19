import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/input-number.dart';
import 'package:sm_app/utils/select-value.dart';
import 'package:sm_app/utils/string-util.dart';

class StockControlReportByTeamLeader extends StatefulWidget {
  @override
  _StockControlReportByTeamLeaderState createState() => _StockControlReportByTeamLeaderState();
}

class _StockControlReportByTeamLeaderState extends State<StockControlReportByTeamLeader> {
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
        text: formatDate(new DateTime.now(), StringUtil.formatDate())
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.distributionTopup,
      actions: <Widget>[
        ButtonSave.buttonSave(_onSave)
      ],
      layout: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: _buildForm(),
          )
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
                controller: _controllerAgentName,
                label: StringRes.initialStock
            ),
            InputField.buildTextField(
                controller: _controllerAgentName,
                label: StringRes.remainingStockTeamLeadYesterday
            ),
            InputNumber.buildTextField(
                controller: _controllerSIMDistribution,
                label: StringRes.simStockReceivedAssistant,
                isEnable: true
            ),
            InputNumber.buildTextField(
                controller: _controllerTopUp,
                label: StringRes.stockDeliveryBackAssistant,
                isEnable: true
            ),
            InputNumber.buildTextField(
                controller: _controllerStockInHand,
                label: StringRes.totalStockAllocate
            ),
            InputNumber.buildTextField(
                controller: _controllerStockTopUp,
                label: StringRes.totalStockTeamLeadTakingBackToday,
            ),
            InputNumber.buildTextField(
                controller: _controllerStockTeamLeader,
                label: StringRes.remainingStockTeamLeaderToday,
            ),
          ],
        )
    );
  }

  void _onSave() {

  }
}
