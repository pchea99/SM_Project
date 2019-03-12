import 'package:flutter/material.dart';
import 'package:sm_app/model_dao/routePlanDAO.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/date-picker.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/select-box.dart';
import 'package:sm_app/utils/shared_preferences.dart';
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

  int _groupValue;
  DateTime _date;
  RoutePlanDAO _data;

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _controllerTeamNo = new TextEditingController(
        text: SharedPreferenceUtils.sharedUser.teamNo);
    _controllerPlannedProvince = new TextEditingController();
    _controllerPlannedDistrict = new TextEditingController();
    _controllerPlannedCommune = new TextEditingController();
    _controllerPlannedVillage = new TextEditingController();
    _getRoutePlan();
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
                groupValue: _groupValue,
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
            InputField.buildTextField(
                controller: _controllerPlannedDistrict,
                label: StringRes.plannedDistrict,
            ),
            InputField.buildTextField(
                controller: _controllerPlannedCommune,
                label: StringRes.plannedCommune,
            ),
            InputField.buildTextField(
                controller: _controllerPlannedVillage,
                label: StringRes.plannedVillage
            ),
          ],
        )
    );
  }

  void _onSave() {
    SpinnerDialog.onSpinner(context);

    _data = new RoutePlanDAO()
      ..team = _controllerTeamNo.text
      ..date = StringUtil.dateToDB(_date)
      ..address.province = _controllerPlannedProvince.text
      ..address.district = _controllerPlannedDistrict.text
      ..address.commune = _controllerPlannedCommune.text
      ..address.village = _controllerPlannedVillage.text
      ..actualVisitVs_Plan = _groupValue == 0 ? 'yes' : 'no'
    ;

    NetworkService.insertRoutePlan(_data).then((value){
      Navigator.pop(context);
    }).catchError((err){
      Navigator.pop(context);
    });
  }

  void _getRoutePlan(){
    NetworkService.getRoutePlan(
        StringUtil.dateToDB(_date),
        SharedPreferenceUtils.sharedUser.teamNo
    ).then((data){
      if(data != null) {
        _data = data;
        _initData();
      }
    });
  }

  void _initData(){
    _controllerPlannedProvince.text = _data.address.province;
    _controllerPlannedDistrict.text = _data.address.district;
    _controllerPlannedCommune.text = _data.address.commune;
    _controllerPlannedVillage.text = _data.address.village;
  }

  void _clear(){
    _controllerPlannedProvince.text = "";
    _controllerPlannedDistrict.text = "";
    _controllerPlannedCommune.text = "";
    _controllerPlannedVillage.text = "";
    _groupValue = null;
    _onSetState();
  }

  void _handleRadioValueChange(int value) {
    _groupValue = value;
    _onSetState();
  }

  void onSelectedDate(value) {
    _date = value;
    _getRoutePlan();
    _clear();
  }

  void _onSetState(){
    if(!mounted){
      return;
    }

    setState(() {});
  }
}
