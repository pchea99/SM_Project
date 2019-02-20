import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/date-picker.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/input-number.dart';
import 'package:sm_app/utils/select-box.dart';
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

  int _radioValue;

  @override
  void initState() {
    super.initState();
    _radioValue = 0;
    _controllerDate = new TextEditingController(
        text: formatDate(new DateTime.now(), StringUtil.dateFormats())
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.routePlan,
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
            SelectBox.selectBox(
                radioValue: _radioValue,
                onChanged: _handleRadioValueChange,
                label: StringRes.actualVisitPlan
            ),
            InputField.buildTextField(
              controller: _controllerTeam,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerAgentName,
                label: StringRes.plannedProvince
            ),
            InputNumber.buildTextField(
                controller: _controllerSIMDistribution,
                label: StringRes.plannedDistrict,
            ),
            InputNumber.buildTextField(
                controller: _controllerTopUp,
                label: StringRes.plannedCommune,
            ),
            InputNumber.buildTextField(
                controller: _controllerStockInHand,
                label: StringRes.plannedVillage
            ),
          ],
        )
    );
  }

  void _onSave() {

  }

  void _handleRadioValueChange(int value) {
    _radioValue = value;
    setState(() {

    });
  }

  void onSelectedDate(value) {

  }
}
