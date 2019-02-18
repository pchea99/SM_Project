import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/select-box.dart';

class DailyRetailerMapping extends StatefulWidget {
  @override
  _DailyRetailerMappingState createState() => _DailyRetailerMappingState();
}

class _DailyRetailerMappingState extends State<DailyRetailerMapping> {
  int _radioValue;
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
    _radioValue = 0;
    _controllerDate = new TextEditingController(
        text: formatDate(new DateTime.now(), [yyyy, '-', mm, '-', dd])
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.dailyRetailerMapping,
      layout: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ContainerForm.buildContainForm(
              Column(
                children: <Widget>[
                  SelectBox.selectBox(
                    radioValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                    label: StringRes.selectRetailer
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
                      controller: _controllerAgentNo,
                      label: StringRes.agentNo
                  ),
                  InputField.buildTextField(
                      controller: _controllerAgentName,
                      label: StringRes.agentName
                  ),
                  InputField.buildTextField(
                      controller: _controllerSIMDistribution,
                      label: StringRes.simDistribution,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                      controller: _controllerTopUp,
                      label: StringRes.topUp,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                      controller: _controllerStockInHand,
                      label: StringRes.stockInHandBTW
                  ),
                  InputField.buildTextField(
                      controller: _controllerStockTopUp,
                      label: StringRes.stockTopUpDTW,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                      controller: _controllerStockTeamLeader,
                      label: StringRes.stockTeamLeaderTBFAT,
                      isEnable: true
                  ),
                  InputField.buildTextField(
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
          ),
        ),
      )
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }
}
