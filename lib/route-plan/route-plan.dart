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

class RoutePlan extends StatefulWidget {
  @override
  _RoutePlanState createState() => _RoutePlanState();
}

class _RoutePlanState extends State<RoutePlan> {
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
            SelectValue.selectView(
                label: StringRes.agentNo,
                callback: null
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

  void _onSave() {

  }
}
