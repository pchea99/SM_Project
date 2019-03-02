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

class StockControlHistoryByAgent extends StatefulWidget {
  @override
  _StockControlHistoryByAgentState createState() => _StockControlHistoryByAgentState();
}

class _StockControlHistoryByAgentState extends State<StockControlHistoryByAgent> {
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
      title: StringRes.stockControlHistoryAgent,
      layout: SingleChildScrollView(
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm(){
    return ContainerForm.buildContainForm(
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SelectValue.selectView(
                  label: StringRes.agentNo,
                  callback: null
              ),
            ),
            DatePicker.datePicker(onSelectedDate),
            InputField.buildTextField(
              controller: _controllerTeam,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerAgentName,
                label: StringRes.agentName
            ),
            InputNumber.buildTextField(
                controller: _controllerSIMDistribution,
                label: StringRes.simDistribution,
            ),
            InputNumber.buildTextField(
                controller: _controllerTopUp,
                label: StringRes.topUp,
            ),
            InputNumber.buildTextField(
                controller: _controllerStockInHand,
                label: StringRes.stockInHandBTW
            ),
            InputNumber.buildTextField(
                controller: _controllerStockTopUp,
                label: StringRes.stockTopUpDTW,
            ),
            InputNumber.buildTextField(
                controller: _controllerStockTeamLeader,
                label: StringRes.stockTeamLeaderTBFAT,
            ),
            InputNumber.buildTextField(
                controller: _controllerRemainStock,
                label: StringRes.remainingStock
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
