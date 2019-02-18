import 'package:flutter/material.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';

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
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.dailyDistributionTopUp,
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
            label: StringRes.team
          ),
          InputField.buildTextField(
              controller: _controllerDate,
              label: StringRes.date
          ),
          InputField.buildTextField(
              controller: _controllerAgentNo,
              label: StringRes.agentNo
          ),
          InputField.buildTextField(
              controller: _controllerAgentName,
              label: StringRes.agentName
          ),
          InputField.buildTextField(
              controller: _controllerSIMDistribution,
              label: StringRes.simDistribution
          ),
          InputField.buildTextField(
              controller: _controllerTopUp,
              label: StringRes.topUp
          ),
          InputField.buildTextField(
              controller: _controllerStockInHand,
              label: StringRes.stockInHandBTW
          ),
          InputField.buildTextField(
              controller: _controllerStockTopUp,
              label: StringRes.stockTopUpDTW
          ),
          InputField.buildTextField(
              controller: _controllerStockTeamLeader,
              label: StringRes.stockTeamLeaderTBFAT
          ),
          InputField.buildTextField(
              controller: _controllerRemainStock,
              label: StringRes.remainingStock
          ),
          InputField.buildTextField(
              controller: _controllerRemark,
              label: StringRes.remark
          ),
        ],
      )
    );
  }

  void _onSave(){

  }
}
