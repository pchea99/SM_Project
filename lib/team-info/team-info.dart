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

class TeamInfo extends StatefulWidget {
  @override
  _TeamInfoState createState() => _TeamInfoState();
}

class _TeamInfoState extends State<TeamInfo> {
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
      title: StringRes.teamInfo,
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
            InputField.buildTextField(
                controller: _controllerAgentName,
                label: StringRes.agentName+" (Eng)"
            ),
            InputField.buildTextField(
                controller: _controllerAgentName,
                label: StringRes.agentName+" (Khmer)"
            ),
            InputField.buildTextField(
              controller: _controllerTeam,
              label: StringRes.sex,
            ),
            InputField.buildTextField(
              controller: _controllerTeam,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerDate,
                label: StringRes.date
            ),
            InputNumber.buildTextField(
                controller: _controllerSIMDistribution,
                label: StringRes.projectLeadName,
            ),
            InputNumber.buildTextField(
                controller: _controllerTopUp,
                label: StringRes.teamLeadName,
            ),
            InputNumber.buildTextField(
                controller: _controllerStockInHand,
                label: StringRes.vanDriverName
            ),
            InputNumber.buildTextField(
                controller: _controllerStockTopUp,
                label: StringRes.vanDriverID,
            ),
            InputNumber.buildTextField(
                controller: _controllerStockTeamLeader,
                label: StringRes.vanPlaqueNumber,
            ),
            InputNumber.buildTextField(
                controller: _controllerRemainStock,
                label: StringRes.position
            ),
            InputField.buildTextField(
                controller: _controllerRemark,
                label: StringRes.idNumber,
            ),
            InputField.buildTextField(
              controller: _controllerRemark,
              label: StringRes.entryDate,
            ),
            InputField.buildTextField(
              controller: _controllerRemark,
              label: StringRes.personalPhone,
            ),
            InputField.buildTextField(
              controller: _controllerRemark,
              label: StringRes.masterSIM,
            ),
            InputField.buildTextField(
              controller: _controllerRemark,
              label: StringRes.masterSIMPassword,
            ),
            InputField.buildTextField(
              controller: _controllerRemark,
              label: StringRes.registeredSIM,
            ),
            InputField.buildTextField(
              controller: _controllerRemark,
              label: StringRes.slaveSIM,
            ),
            InputField.buildTextField(
              controller: _controllerRemark,
              label: StringRes.slaveSIMPassword,
            ),
          ],
        )
    );
  }

  void _onSave() {

  }
}
