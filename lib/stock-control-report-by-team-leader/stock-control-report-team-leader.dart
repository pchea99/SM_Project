import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/login/login.dart';
import 'package:sm_app/model_dao/dailySummaryDAO.dart';
import 'package:sm_app/model_dao/stockControlReportByTeamLeaderDAO.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/input-number.dart';
import 'package:sm_app/utils/spinner-dialog.dart';
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
  DailySummaryDAO _dailySummary;
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
    _getDailySummary();
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
            InputNumber.buildTextField(
                controller: _controllerInitialStockInHandForTeamLeader,
                label: StringRes.initialStock
            ),
            InputNumber.buildTextField(
                controller: _controllerRemainingStockAtTeamLeaderFromYesterday,
                label: StringRes.remainingStockTeamLeadYesterday
            ),
            InputNumber.buildTextField(
                controller: _controllerSIMStockReceivedByAssistant,
                label: StringRes.simStockReceivedAssistant,
                isEnable: true,
                onChanged: (value){
                  _remainStockToday();
                }
            ),
            InputNumber.buildTextField(
                controller: _controllerStockDeliveredBackToAssistant,
                label: StringRes.stockDeliveryBackAssistant,
                isEnable: true,
                onChanged: (value){
                  _remainStockToday();
                }
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
      SpinnerDialog.onSpinner(context);
      _saveStockControlReportTeamLeader();
      _saveDailySummary();
    }
  }

  void _getStockControlReportTeamLeader(){
    _stockCRTL = null;
    NetworkService.getStockControlReportTeamLeader(
        StringUtil.dateToDB(_date),
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

  void _saveStockControlReportTeamLeader() async {
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
        double.parse(_controllerSIMStockReceivedByAssistant.text)
        ..stock.stockDeliveredBackToAssistant =
        double.parse(_controllerStockDeliveredBackToAssistant.text)
        ..stock.totalStockAllocatedToAllAgent =
            _stockCRTL.stock.totalStockAllocatedToAllAgent
        ..stock.totalStockReturnTeamLeaderTakingBackToday =
            _stockCRTL.stock.totalStockReturnTeamLeaderTakingBackToday
        ..stock.remainStockTeamLeaderForToday = double.parse(_controllerRemainingStockAtTeamLeaderForToday.text)
      ;

      _stockCRTL = stockReport;
    }

    await NetworkService.insertStockControlReportByTeamLeader(_stockCRTL);
    Navigator.pop(context);
  }

  void _saveDailySummary() {
    if(_dailySummary == null){
      _dailySummary = new DailySummaryDAO()
        ..date = StringUtil.dateToDB(_date)
        ..team = _controllerTeam.text
//        ..address.province = _province
        ..agentNumber = 1
        ..stock.totalTopup = 0.0
        ..stock.totalDistribution = 0.0
        ..stock.remainStockAgent = 0.0
        ..stock.remainStockTeamLeader = 0.0
        ..stock.totalRemainStock = double.parse(_controllerRemainingStockAtTeamLeaderForToday.text.toString())
      ;
    }else{
      DailySummaryDAO summary = new DailySummaryDAO()
        ..date = StringUtil.dateToDB(_date)
        ..team = _controllerTeam.text
//        ..address.province = _province
        ..agentNumber = _dailySummary.agentNumber
        ..stock.totalTopup = _dailySummary.stock.totalTopup
        ..stock.totalDistribution = _dailySummary.stock.totalDistribution
        ..stock.remainStockAgent = _dailySummary.stock.totalRemainStock
        ..stock.remainStockTeamLeader = double.parse(_controllerRemainingStockAtTeamLeaderForToday.text.toString())
        ..stock.totalRemainStock = _dailySummary.stock.totalRemainStock
      ;

      _dailySummary = summary;
    }

    NetworkService.insertDailySummary(_dailySummary);
  }

  void _onSetState() {
    if(!mounted){
      return;
    }

    setState(() {});
  }

  void _remainStockToday() {
    double amt = 0.0;
    if (_stockCRTL != null) {
      amt = _stockCRTL.stock.initialStockInHandForTeamLeader
          + _stockCRTL.stock.remainStockTeamLeaderFromYesterday
          + (_controllerSIMStockReceivedByAssistant.text == null || _controllerSIMStockReceivedByAssistant.text.isEmpty
              ? 0 : double.parse(_controllerSIMStockReceivedByAssistant.text))
          - (_controllerStockDeliveredBackToAssistant.text == null || _controllerStockDeliveredBackToAssistant.text.isEmpty
              ? 0 :double.parse(_controllerStockDeliveredBackToAssistant.text))
          - _stockCRTL.stock.totalStockAllocatedToAllAgent
          + _stockCRTL.stock.totalStockReturnTeamLeaderTakingBackToday;
    }
    _controllerRemainingStockAtTeamLeaderForToday.text = amt.toString();
    _onSetState();
  }

  void _getDailySummary() {
    _dailySummary = null;
    NetworkService.getSummaryByTeam(
        StringUtil.dateToDB(_date), _controllerTeam.text
    ).then((data){
      if(data != null){
        _dailySummary = data;
      }
    });
  }
}
