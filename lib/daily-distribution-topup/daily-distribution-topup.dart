import 'package:flutter/material.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:date_format/date_format.dart';
import 'package:sm_app/utils/input-number.dart';
import 'package:sm_app/utils/select-value.dart';
import 'package:sm_app/utils/string-util.dart';
import 'package:firebase_database/firebase_database.dart';

class DailyDistributionTopUp extends StatefulWidget {
  @override
  _DailyDistributionTopUpState createState() => _DailyDistributionTopUpState();
}

class _DailyDistributionTopUpState extends State<DailyDistributionTopUp> {
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
      title: StringRes.distributionTopup,
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SelectValue.selectView(
                label: StringRes.agentNo,
                callback: _onSelectAgentNo
            ),
          ),
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
              label: StringRes.agentName
          ),
          InputNumber.buildTextField(
              controller: _controllerSIMDistribution,
              label: StringRes.simDistribution,
              isEnable: true
          ),
          InputNumber.buildTextField(
              controller: _controllerTopUp,
              label: StringRes.topUp,
              isEnable: true
          ),
          InputNumber.buildTextField(
              controller: _controllerStockInHand,
              label: StringRes.stockInHandBTW
          ),
          InputNumber.buildTextField(
              controller: _controllerStockTopUp,
              label: StringRes.stockTopUpDTW,
              isEnable: true
          ),
          InputNumber.buildTextField(
              controller: _controllerStockTeamLeader,
              label: StringRes.stockTeamLeaderTBFAT,
              isEnable: true
          ),
          InputNumber.buildTextField(
              controller: _controllerRemainStock,
              label: StringRes.remainingStock
          ),
          InputField.buildTextField(
              controller: _controllerRemark,
              label: StringRes.remark,
              isEnable: true
          ),
        ],
      )
    );
  }

  void _onSave(){

  }

  void _onSelectAgentNo() {

  }
}
