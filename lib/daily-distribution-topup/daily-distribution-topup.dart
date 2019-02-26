import 'package:flutter/material.dart';
import 'package:sm_app/daily-distribution-topup/dd-topup-service.dart';
import 'package:sm_app/model_dao/dailyDistributionTopUpDAO.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:date_format/date_format.dart';
import 'package:sm_app/utils/input-number.dart';
import 'package:sm_app/utils/navigate-to.dart';
import 'package:sm_app/utils/safe-value.dart';
import 'package:sm_app/utils/select-value.dart';
import 'package:sm_app/utils/snackbar.dart';
import 'package:sm_app/utils/spinner-dialog.dart';
import 'package:sm_app/utils/string-util.dart';
import 'package:firebase_database/firebase_database.dart';

class DailyDistributionTopUp extends StatefulWidget {
  @override
  _DailyDistributionTopUpState createState() => _DailyDistributionTopUpState();
}

class _DailyDistributionTopUpState extends State<DailyDistributionTopUp> {
  TextEditingController _controllerTeam;
  TextEditingController _controllerDate;
  TextEditingController _controllerAgentName;
  TextEditingController _controllerSIMDistribution;
  TextEditingController _controllerTopUp;
  TextEditingController _controllerTopUpAmount;
  TextEditingController _controllerStockInHand;
  TextEditingController _controllerStockTopUp;
  TextEditingController _controllerStockTeamLeader;
  TextEditingController _controllerRemainStock;
  TextEditingController _controllerRemark;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _txtAgentNo;

  @override
  void initState() {
    super.initState();
    _controllerDate = new TextEditingController(
      text: formatDate(new DateTime.now(), StringUtil.dateFormats())
    );
    _controllerTeam = new TextEditingController();
    _controllerAgentName = new TextEditingController();
    _controllerSIMDistribution = new TextEditingController()..addListener((){
      _remainStock();
    });
    _controllerTopUp = new TextEditingController();
    _controllerStockInHand = new TextEditingController();
    _controllerStockTopUp = new TextEditingController()..addListener((){
      _remainStock();
    });
    _controllerStockTeamLeader = new TextEditingController()..addListener((){
      _remainStock();
    });
    _controllerRemainStock = new TextEditingController(text: '0.0');
    _controllerRemark = new TextEditingController();
    _controllerTopUpAmount = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      scaffoldKey: _scaffoldKey,
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
                callback: _onTabAgentNo
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
              controller: _controllerTopUp,
              label: StringRes.topUpAmount,
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
    if(_controllerSIMDistribution.text == null || _controllerSIMDistribution.text.isEmpty){
      SnackBarUtil.showInSnackBar(_scaffoldKey, "SIM Distribution is required!");
      return;
    }
    if(_controllerTopUp.text == null || _controllerTopUp.text.isEmpty){

    }
    if(_controllerTopUpAmount.text == null || _controllerTopUpAmount.text.isEmpty){

    }

    _saveToDB();
  }

  void _saveToDB() {
    SpinnerDialog.onSpinner(context);
    DailyDistributionTopUpDAO data = new DailyDistributionTopUpDAO()
      ..team = _txtAgentNo
      ..agent.agentNo = _controllerAgentName.text
      ..date = DateTime.parse(_controllerDate.text)
      ..agent.agentNameEn = _controllerAgentName.text
      ..stock.simDistribution = SafeValue.getSafeDouble(_controllerSIMDistribution.text)
      ..stock.topup = SafeValue.getSafeDouble(_controllerTopUp.text)
      ..stock.topUpAmount = SafeValue.getSafeDouble(_controllerTopUpAmount.text)
      ..stock.stockInHandBeforeTodayWork = SafeValue.getSafeDouble(_controllerStockInHand.text)
      ..stock.stockTopUpDuringTodayWork = SafeValue.getSafeDouble(_controllerStockTopUp.text)
      ..stock.stockTeamLeaderTakingBackFromByAgent = SafeValue.getSafeDouble(_controllerStockTeamLeader.text)
      ..stock.remainStockForTomorrowWorkAgent = SafeValue.getSafeDouble(_controllerRemainStock.text)
      ..remark = _controllerRemark.text
    ;

    DDTopUPService.insertDDTopUp(data).then((value){
      Navigator.pop(context);
    }).catchError((err){
      Navigator.pop(context);
    });
  }

  _remainStock(){
    double remain = 0.0;
    remain = (SafeValue.getSafeDouble(_controllerStockInHand.text) +
        SafeValue.getSafeDouble(_controllerStockTopUp.text)) -
        (SafeValue.getSafeDouble(_controllerSIMDistribution.text) +
            SafeValue.getSafeDouble(_controllerStockTeamLeader.text));
    _controllerRemainStock.text = remain.toString();
    _onSetState();
  }

  void _onTabAgentNo() async {
    _txtAgentNo = await NavigateTo.navigateTo(context: context, );
  }

  void _onSetState(){
    if(!mounted){
      return;
    }

    setState(() {});
  }
}
