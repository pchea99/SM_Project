import 'package:flutter/material.dart';
import 'package:sm_app/list-view/list-view-agent.dart';
import 'package:sm_app/login/login.dart';
import 'package:sm_app/model_dao/dailyDistributionTopUpDAO.dart';
import 'package:sm_app/model_dao/dailySummaryDAO.dart';
import 'package:sm_app/model_dao/stockControlHistoryByAgentDAO.dart';
import 'package:sm_app/model_dao/stockControlReportByTeamLeaderDAO.dart';
import 'package:sm_app/network-service/network.dart';
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
  DateTime _date;
  StockControlHistoryByAgentDAO _stockControlHistoryByAgent;
  DailySummaryDAO _dailySummary;
  StockControlReportByTeamLeaderDAO _stockControlReportByTeamLeaderDAO;
//  String _province;

  @override
  void initState() {
    super.initState();

    _controllerDate = new TextEditingController(
      text: formatDate(new DateTime.now(), StringUtil.dateFormats())
    );
    _date = DateTime.now();
    _controllerTeam = new TextEditingController(text: sharedUser.teamNo);
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
                value: _txtAgentNo,
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
              controller: _controllerTopUpAmount,
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
      SnackBarUtil.showInSnackBar(_scaffoldKey, StringRes.simDistriutionRequired);
      return;
    }
    if(_controllerTopUp.text == null || _controllerTopUp.text.isEmpty){
      SnackBarUtil.showInSnackBar(_scaffoldKey, StringRes.topupRequired);
      return;
    }
    if(_controllerTopUpAmount.text == null || _controllerTopUpAmount.text.isEmpty){
      SnackBarUtil.showInSnackBar(_scaffoldKey, StringRes.topUPAmtRequired);
      return;
    }

    _saveToDB();
  }

  void _saveToDB() {
    SpinnerDialog.onSpinner(context);

    _saveDailyDistribution();

    _saveStockControlHistoryAgent();

    _saveDailySummary();

    _saveStockControlReportTeamLeader();
  }

  void _saveDailyDistribution() {
    DailyDistributionTopUpDAO data = new DailyDistributionTopUpDAO()
      ..team = _controllerTeam.text
      ..agent.agentNo = _txtAgentNo
      ..date = StringUtil.dateToDB(_date)
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

    NetworkService.insertDailyDistributionTopUp(data).then((value){
      Navigator.pop(context);
      Navigator.pop(context);
    }).catchError((err){
      Navigator.pop(context);
    });
  }

  void _saveStockControlHistoryAgent() {
    _stockControlHistoryByAgent = new StockControlHistoryByAgentDAO()
      ..team = _controllerTeam.text
      ..agent.agentNo = _txtAgentNo
      ..agent.agentNameEn = _controllerAgentName.text
      ..date = StringUtil.dateToDB(_date)
      ..stock.simDistribution = double.parse(_controllerSIMDistribution.text)
      ..stock.topup = double.parse(_controllerTopUp.text)
      ..stock.stockInHandBeforeTodayWork = double.parse(_controllerRemainStock.text)
      ..stock.stockTopUpDuringTodayWork = double.parse(_controllerStockTopUp.text)
      ..stock.stockTeamLeaderTakingBackFromByAgent = double.parse(_controllerStockTeamLeader.text)
      ..stock.remainStockForTomorrowWorkAgent = double.parse(_controllerRemainStock.text)
    ;

    NetworkService.insertStockHistoryByAgent(_stockControlHistoryByAgent);
  }

  void _saveDailySummary() {
    if(_dailySummary == null){
      _dailySummary = new DailySummaryDAO()
        ..date = StringUtil.dateToDB(_date)
        ..team = _controllerTeam.text
//        ..address.province = _province
        ..agentNumber = 1
        ..stock.totalTopup = double.parse(_controllerTopUp.text)
        ..stock.totalDistribution = double.parse(_controllerSIMDistribution.text)
         ..stock.remainStockAgent = double.parse(_controllerRemainStock.text)
        ..stock.remainStockTeamLeader = double.parse("0.0")
        ..stock.totalRemainStock = double.parse(_controllerRemainStock.text)
      ;
    }else{
      int distribution = 0;
      if(_controllerSIMDistribution.text != null && _controllerSIMDistribution.text.isNotEmpty){
        distribution = 1;
      }
      DailySummaryDAO summary = new DailySummaryDAO()
        ..date = StringUtil.dateToDB(_date)
        ..team = _controllerTeam.text
//        ..address.province = _province
        ..agentNumber = _dailySummary.agentNumber + distribution
        ..stock.totalTopup = double.parse(_controllerTopUp.text) + _dailySummary.stock.totalTopup
        ..stock.totalDistribution = double.parse(_controllerSIMDistribution.text) + _dailySummary.stock.totalDistribution
        ..stock.remainStockAgent = double.parse(_controllerRemainStock.text) + _dailySummary.stock.totalRemainStock
        ..stock.remainStockTeamLeader = double.parse("0.0")
        ..stock.totalRemainStock = double.parse(_controllerRemainStock.text) + _dailySummary.stock.totalRemainStock
      ;

      _dailySummary = summary;
    }

    NetworkService.insertDailySummary(_dailySummary);
  }

  void _saveStockControlReportTeamLeader() {
     if(_stockControlReportByTeamLeaderDAO == null){
       _stockControlReportByTeamLeaderDAO = new StockControlReportByTeamLeaderDAO()
        ..date = StringUtil.dateToDB(_date)
        ..team = _controllerTeam.text
        ..stock.initialStockInHandForTeamLeader = 0.0
        ..stock.remainStockTeamLeaderFromYesterday = 0.0
        ..stock.simStockReceivedByAssistant = 0.0
        ..stock.stockDeliveredBackToAssistant = 0.0
        ..stock.totalStockAllocatedToAllAgent = _sumTotalStockAllocatedToAllAgent()
        ..stock.totalStockReturnTeamLeaderTakingBackToday =_sumTotalStockReturnTeamLeaderTakingBackToday();
    }else{
      StockControlReportByTeamLeaderDAO stockReport = new StockControlReportByTeamLeaderDAO()
        ..date = StringUtil.dateToDB(_date)
        ..team = _controllerTeam.text
        ..stock.initialStockInHandForTeamLeader =
            _stockControlReportByTeamLeaderDAO.stock.initialStockInHandForTeamLeader
        ..stock.remainStockTeamLeaderFromYesterday =
            _stockControlReportByTeamLeaderDAO.stock.remainStockTeamLeaderFromYesterday
        ..stock.simStockReceivedByAssistant =
            _stockControlReportByTeamLeaderDAO.stock.simStockReceivedByAssistant
        ..stock.stockDeliveredBackToAssistant =
            _stockControlReportByTeamLeaderDAO.stock.stockDeliveredBackToAssistant
        ..stock.totalStockAllocatedToAllAgent =
            _stockControlReportByTeamLeaderDAO.stock.totalStockAllocatedToAllAgent
                + _sumTotalStockAllocatedToAllAgent()
        ..stock.totalStockReturnTeamLeaderTakingBackToday =
            _stockControlReportByTeamLeaderDAO.stock.totalStockReturnTeamLeaderTakingBackToday
                + _sumTotalStockReturnTeamLeaderTakingBackToday()
      ;

      _stockControlReportByTeamLeaderDAO = stockReport;
    }

    NetworkService.insertStockControlReportByTeamLeader(_stockControlReportByTeamLeaderDAO);
  }

  double _sumTotalStockAllocatedToAllAgent() {
    return (double.parse(_controllerStockTopUp.text) -
        double.parse(_controllerSIMDistribution.text)
        + double.parse(_controllerTopUp.text));
  }

  double _sumTotalStockReturnTeamLeaderTakingBackToday() {
    return (double.parse(_controllerStockTeamLeader.text) -
        double.parse(_controllerSIMDistribution.text)
        + double.parse(_controllerTopUp.text));
  }

  _remainStock(){
    double remain = 0.0;
    remain = SafeValue.getSafeDouble(_controllerStockInHand.text) +
        SafeValue.getSafeDouble(_controllerStockTopUp.text) -
        SafeValue.getSafeDouble(_controllerSIMDistribution.text) -
        SafeValue.getSafeDouble(_controllerStockTeamLeader.text);
    _controllerRemainStock.text = remain.toString();
    _onSetState();
  }

  void _onTabAgentNo() async {
    var callback = await NavigateTo.navigateTo(
        context: context,
        route: ListViewAgent(teamNo: sharedUser.teamNo)
    );
    if(callback != null){
      _txtAgentNo = callback.agentNo;
      _controllerAgentName.text = callback.agentNameEn;
      //_province = callback.province;
      _getStockInHand();
      _getDailySummary();
      _getStockControlReportTeamLeader();
      _onSetState();
    }
  }

  void _getDailySummary() {
    _dailySummary = null;
    NetworkService.getSummaryByDateTeamAgent(
        StringUtil.dateToDB(_date), _controllerTeam.text, _txtAgentNo
    ).then((data){
      if(data != null){
        _dailySummary = data;
      }
    });
  }

  void _onSetState(){
    if(!mounted){
      return;
    }

    setState(() {});
  }

  void _getStockInHand(){
    _controllerStockInHand.text = "";
    NetworkService.getStockByTeamAgent(
        StringUtil.dateToDB(_date.subtract(const Duration(days: 1))),
        _controllerTeam.text, _txtAgentNo
    ).then((data){
      _controllerStockInHand.text = data.stock.stockInHandBeforeTodayWork.toString();
      _onSetState();
    });
  }

  void _getStockControlReportTeamLeader(){
    _stockControlReportByTeamLeaderDAO = null;
    NetworkService.getStockControlReportTeamLeader(
        StringUtil.dateToDB(_date.subtract(const Duration(days: 1))),
        _controllerTeam.text
    ).then((data){
      if(data != null){
        _stockControlReportByTeamLeaderDAO = data;
      }
      _onSetState();
    });
  }
}
