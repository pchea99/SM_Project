import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/select-box.dart';
import 'package:sm_app/utils/select-value.dart';

class DailyRetailerMapping extends StatefulWidget {
  @override
  _DailyRetailerMappingState createState() => _DailyRetailerMappingState();
}

class _DailyRetailerMappingState extends State<DailyRetailerMapping> {
  int _radioValue;
  TextEditingController _controllerTeam;
  TextEditingController _controllerDate;
  TextEditingController _controllerDistrict;
  TextEditingController _controllerCommune;
  TextEditingController _controllerVillage;
  TextEditingController _controllerRetailerName;
  TextEditingController _controllerRetailerPhone;
  TextEditingController _controllerLatitude;
  TextEditingController _controllerLongtitude;

  @override
  void initState() {
    super.initState();
    _radioValue = 0;
    _controllerDate = new TextEditingController(
        text: formatDate(new DateTime.now(), [dd, '-', mm, '-', yyyy])
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
        title: StringRes.dailyRetailerMapping,
        actions: <Widget>[
          ButtonSave.buttonSave(_onSave)
        ],
        layout: _buildForm()
    );
  }

  SingleChildScrollView _buildForm() {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ContainerForm.buildContainForm(
              Column(
                children: <Widget>[
                  SelectBox.selectBox(
                      radioValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                      label: StringRes.anotherRetailer
                  ),
                  InputField.buildTextField(
                    controller: _controllerTeam,
                    label: StringRes.team,
                  ),
                  InputField.buildTextField(
                      controller: _controllerDate,
                      label: StringRes.date
                  ),
                  SelectValue.selectView(
                      label: StringRes.province,
                      callback: _onSelectProvince
                  ),
                  InputField.buildTextField(
                      controller: _controllerDistrict,
                      label: StringRes.district,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                      controller: _controllerCommune,
                      label: StringRes.commune,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                      controller: _controllerVillage,
                      label: StringRes.village,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                      controller: _controllerRetailerName,
                      label: StringRes.retailerName,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                      controller: _controllerRetailerPhone,
                      label: StringRes.retailerPhone,
                      isEnable: true
                  ),
                  InputField.buildTextField(
                    controller: _controllerLatitude,
                    label: StringRes.latitude,
                  ),
                  InputField.buildTextField(
                      controller: _controllerLongtitude,
                      label: StringRes.longtitude
                  ),
                ],
              )
          ),
        ),
      );
  }

  void _handleRadioValueChange(int value) {
    _radioValue = value;
    _onSetState();
  }

  void _onSelectProvince() {

  }

  void _onSetState(){
    if(!mounted){
      return;
    }

    setState(() {});
  }

  void _onSave() {

  }
}
