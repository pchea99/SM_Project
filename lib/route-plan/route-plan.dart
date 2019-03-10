import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sm_app/model_dao/routePlanDAO.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/date-picker.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/input-number.dart';
import 'package:sm_app/utils/select-box.dart';
import 'package:sm_app/utils/spinner-dialog.dart';
import 'package:sm_app/utils/string-util.dart';

class RoutePlan extends StatefulWidget {
  @override
  _RoutePlanState createState() => _RoutePlanState();
}

class _RoutePlanState extends State<RoutePlan> {
  TextEditingController _controllerTeamNo;
  TextEditingController _controllerPlannedProvince;
  TextEditingController _controllerPlannedDistrict;
  TextEditingController _controllerPlannedCommune;
  TextEditingController _controllerPlannedVillage;

  int _radioValue;
  DateTime _date;

  @override
  void initState() {
    super.initState();
    _radioValue = 0;
    _date = DateTime.now();
    _controllerTeamNo = new TextEditingController();
    _controllerPlannedProvince = new TextEditingController();
    _controllerPlannedDistrict = new TextEditingController();
    _controllerPlannedCommune = new TextEditingController();
    _controllerPlannedVillage = new TextEditingController();
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
              controller: _controllerTeamNo,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerPlannedProvince,
                label: StringRes.plannedProvince
            ),
            InputNumber.buildTextField(
                controller: _controllerPlannedDistrict,
                label: StringRes.plannedDistrict,
            ),
            InputNumber.buildTextField(
                controller: _controllerPlannedCommune,
                label: StringRes.plannedCommune,
            ),
            InputNumber.buildTextField(
                controller: _controllerPlannedVillage,
                label: StringRes.plannedVillage
            ),
          ],
        )
    );
  }

  void _onSave() {
    SpinnerDialog.onSpinner(context);

    RoutePlanDAO data = new RoutePlanDAO()
      ..team = _controllerTeamNo.text
      ..date = StringUtil.dateToDB(_date)
      ..address.province = _controllerPlannedProvince.text
      ..address.district = _controllerPlannedDistrict.text
      ..address.commune = _controllerPlannedCommune.text
      ..address.village = _controllerPlannedVillage.text
      ..actualVisitVs_Plan = _radioValue == 0 ? 'yes' : 'no'
    ;

    NetworkService.insertRoutePlan(data).then((value){
      Navigator.pop(context);
    }).catchError((err){
      Navigator.pop(context);
    });
  }

  void _handleRadioValueChange(int value) {
    _radioValue = value;
    _onSetState();
  }

  void onSelectedDate(value) {
    _date = value;
  }

  void _onSetState(){
    if(!mounted){
      return;
    }

    setState(() {});
  }
}
