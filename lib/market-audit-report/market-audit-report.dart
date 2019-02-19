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

class MarketAuditReport extends StatefulWidget {
  @override
  _MarketAuditReportState createState() => _MarketAuditReportState();
}

class _MarketAuditReportState extends State<MarketAuditReport> {
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
      title: StringRes.marketAuditReport,
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
                controller: _controllerSIMDistribution,
                label: StringRes.remarkAgent,
                isEnable: true
            ),
            InputField.buildTextField(
                controller: _controllerTopUp,
                label: StringRes.remarkVisit,
                isEnable: true
            ),
            InputField.buildTextField(
                controller: _controllerStockInHand,
                label: StringRes.remarkSystem,
                isEnable: true
            ),
            InputField.buildTextField(
                controller: _controllerStockTopUp,
                label: StringRes.otherIssue,
                isEnable: true
            ),
          ],
        )
    );
  }

  void _onSave() {

  }
}
