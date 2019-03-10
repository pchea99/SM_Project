import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/login/login.dart';
import 'package:sm_app/model_dao/stockControlReportByTeamLeaderDAO.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/input-number.dart';
import 'package:sm_app/utils/string-util.dart';

class StockControlReportByTeamLeader extends StatefulWidget {
  @override
  _StockControlReportByTeamLeaderState createState() => _StockControlReportByTeamLeaderState();
}

class _StockControlReportByTeamLeaderState extends State<StockControlReportByTeamLeader> {
  TextEditingController _controllerTeam;
  TextEditingController _controllerDate;
  TextEditingController _controllerInitialStockInHandForTeamLeader;
  TextEditingController _controllerRemainingStockAtTeamLeaderFromYesterday;
  TextEditingController _controllerSIMStockReceivedByAssistant;
  TextEditingController _controllerStockDeliveredBackToAssistant;
  TextEditingController _controllerTotalStockAllocatedToAllAgent;
  TextEditingController _controllerTotalStockTeamLeaderTakingBackToday;
  TextEditingController _controllerRemainingStockAtTeamLeaderForToday;

  StockControlReportByTeamLeaderDAO _stockCRTL;
  DateTime _date;

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _controllerDate = new TextEditingController(
        text: formatDate(_date, StringUtil.dateFormats())
    );
    _controllerTeam = new TextEditingController(text: sharedUser.teamNo);
    _controllerInitialStockInHandForTeamLeader = new TextEditingController();
    _controllerRemainingStockAtTeamLeaderFromYesterday = new TextEditingController();
    _controllerSIMStockReceivedByAssistant = new TextEditingController();
    _controllerStockDeliveredBackToAssistant = new TextEditingController();
    _controllerTotalStockAllocatedToAllAgent = new TextEditingController();
    _controllerTotalStockTeamLeaderTakingBackToday = new TextEditingController();
    _controllerRemainingStockAtTeamLeaderForToday = new TextEditingController();
    _getStockControlReportTeamLeader();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.stockControlReportTeamLeader,
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
            InputField.buildTextField(
              controller: _controllerTeam,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerDate,
                label: StringRes.date
            ),
            InputField.buildTextField(
                controller: _controllerInitialStockInHandForTeamLeader,
                label: StringRes.initialStock
            ),
            InputField.buildTextField(
                controller: _controllerRemainingStockAtTeamLeaderFromYesterday,
                label: StringRes.remainingStockTeamLeadYesterday
            ),
            InputNumber.buildTextField(
                controller: _controllerSIMStockReceivedByAssistant,
                label: StringRes.simStockReceivedAssistant,
                isEnable: true
            ),
            InputNumber.buildTextField(
                controller: _controllerStockDeliveredBackToAssistant,
                label: StringRes.stockDeliveryBackAssistant,
                isEnable: true
            ),
            InputNumber.buildTextField(
                controller: _controllerTotalStockAllocatedToAllAgent,
                label: StringRes.totalStockAllocate
            ),
            InputNumber.buildTextField(
                controller: _controllerTotalStockTeamLeaderTakingBackToday,
                label: StringRes.totalStockTeamLeadTakingBackToday,
            ),
            InputNumber.buildTextField(
                controller: _controllerRemainingStockAtTeamLeaderForToday,
                label: StringRes.remainingStockTeamLeaderToday,
            ),
          ],
        )
    );
  }

  void _onSave() {
    if(_controllerSIMStockReceivedByAssistant.text != null
        && _controllerSIMStockReceivedByAssistant.text.isNotEmpty
    && _controllerStockDeliveredBackToAssistant.text != null
    && _controllerStockDeliveredBackToAssistant.text.isNotEmpty){
      _saveStockControlReportTeamLeader();
    }
  }

  void _getStockControlReportTeamLeader(){
    _stockCRTL = null;
    NetworkService.getStockControlReportTeamLeader(
        StringUtil.dateToDB(_date.subtract(const Duration(days: 1))),
        _controllerTeam.text
    ).then((data){
      if(data != null){
        _stockCRTL = data;
        _initData();
      }
      _onSetState();
    });
  }

  void _initData(){
    _controllerInitialStockInHandForTeamLeader.text = _stockCRTL.stock.initialStockInHandForTeamLeader.toString();
    _controllerRemainingStockAtTeamLeaderFromYesterday.text = _stockCRTL.stock.remainStockTeamLeaderFromYesterday.toString();
    _controllerTotalStockAllocatedToAllAgent.text = _stockCRTL.stock.totalStockAllocatedToAllAgent.toString();
    _controllerTotalStockTeamLeaderTakingBackToday.text = _stockCRTL.stock.totalStockReturnTeamLeaderTakingBackToday.toString();
    _controllerRemainingStockAtTeamLeaderForToday.text = _stockCRTL.stock.remainStockTeamLeaderForToday.toString();
  }

  void _saveStockControlReportTeamLeader() {
    if(_stockCRTL == null){
      _stockCRTL = new StockControlReportByTeamLeaderDAO()
        ..date = StringUtil.dateToDB(_date)
        ..team = _controllerTeam.text
        ..stock.initialStockInHandForTeamLeader = 0.0
        ..stock.remainStockTeamLeaderFromYesterday = 0.0
        ..stock.simStockReceivedByAssistant = double.parse(_controllerSIMStockReceivedByAssistant.text)
        ..stock.stockDeliveredBackToAssistant = double.parse(_controllerStockDeliveredBackToAssistant.text)
        ..stock.totalStockAllocatedToAllAgent = _stockCRTL.stock.totalStockAllocatedToAllAgent
        ..stock.totalStockReturnTeamLeaderTakingBackToday = _stockCRTL.stock.totalStockReturnTeamLeaderTakingBackToday;
    }else{
      StockControlReportByTeamLeaderDAO stockReport = new StockControlReportByTeamLeaderDAO()
        ..date = StringUtil.dateToDB(_date)
        ..team = _controllerTeam.text
        ..stock.initialStockInHandForTeamLeader =
            _stockCRTL.stock.initialStockInHandForTeamLeader
        ..stock.remainStockTeamLeaderFromYesterday =
            _stockCRTL.stock.remainStockTeamLeaderFromYesterday
        ..stock.simStockReceivedByAssistant =
            _stockCRTL.stock.simStockReceivedByAssistant
        ..stock.stockDeliveredBackToAssistant =
            _stockCRTL.stock.stockDeliveredBackToAssistant
        ..stock.totalStockAllocatedToAllAgent =
            _stockCRTL.stock.totalStockAllocatedToAllAgent
        ..stock.totalStockReturnTeamLeaderTakingBackToday =
            _stockCRTL.stock.totalStockReturnTeamLeaderTakingBackToday
        ..stock.remainStockTeamLeaderForToday = _remainStockToday()
      ;

      _stockCRTL = stockReport;
    }

    NetworkService.insertStockControlReportByTeamLeader(_stockCRTL);
  }

  void _onSetState() {
    if(!mounted){
      return;
    }

    setState(() {});
  }

  double _remainStockToday() {
    double amt = 0.0;
    if(_stockCRTL != null){
      amt = _stockCRTL.stock.initialStockInHandForTeamLeader + _stockCRTL.stock.remainStockTeamLeaderFromYesterday
          + double.parse(_controllerSIMStockReceivedByAssistant.text) - double.parse(_controllerStockDeliveredBackToAssistant.text)
          - _stockCRTL.stock.totalStockAllocatedToAllAgent + _stockCRTL.stock.totalStockReturnTeamLeaderTakingBackToday;
    }
    return amt;
  }
}
