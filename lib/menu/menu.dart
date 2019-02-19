import 'package:flutter/material.dart';
import 'package:sm_app/daily-distribution-topup/daily-distribution-topup.dart';
import 'package:sm_app/daily-feedback/daily-feedback.dart';
import 'package:sm_app/daily-retailer-mapping/daily-retailer-mapping.dart';
import 'package:sm_app/daily-summary/daily-summary.dart';
import 'package:sm_app/login/login.dart';
import 'package:sm_app/market-audit-report/market-audit-report.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/route-plan/route-plan.dart';
import 'package:sm_app/stock-control-history-agent/stock-control-history-agent.dart';
import 'package:sm_app/stock-control-report-by-team-leader/stock-control-report-team-leader.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/navigate-to.dart';
import 'package:sweetalert/sweetalert.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  List<String> _menus = [
    StringRes.distributionTopup,
    StringRes.dailyRetailerMapping,
    StringRes.dailyFeedback,
    StringRes.dailySummary,
    StringRes.stockControlHistoryAgent,
    StringRes.stockControlReportTeamLeader,
    StringRes.routePlan,
    StringRes.marketAuditReport,
    StringRes.teamInfo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringRes.menu,
          style: TextStyle(
            color: Colors.white,
            fontSize: FontSizeRes.title
          ),
        ),
        actions: <Widget>[
          _buildIconLogout()
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 6.0),
        child: ListView(
          shrinkWrap: true,
          children: _menus.map((menu)=>
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey[100]
                        )
                    )
                ),
                child: ListTile(
                  title: Text(menu),
                  onTap: (){
                    _click(menu);
                  },
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.grey,
                  ),
                ),
              )
          ).toList(),
        ),
      ),
    );
  }
  Widget _buildIconLogout() {
    return IconButton(
      icon: Icon(
        Icons.exit_to_app,
        color: Colors.red[200],
      ),
      onPressed: () {
        _onLogout();
      },
    );
  }

  void _click(String title) {
    if(title == StringRes.distributionTopup){
      _navigateTo(DailyDistributionTopUp());
    }else if(title == StringRes.dailyRetailerMapping){
      _navigateTo(DailyRetailerMapping());
    }else if(title == StringRes.dailyFeedback){
      _navigateTo(DailyFeedback());
    }else if(title == StringRes.dailySummary){
      _navigateTo(DailySummary());
    }else if(title == StringRes.stockControlHistoryAgent){
      _navigateTo(StockControlHistoryByAgent());
    }else if(title == StringRes.stockControlReportTeamLeader){
      _navigateTo(StockControlReportByTeamLeader());
    }else if(title == StringRes.routePlan){
      _navigateTo(RoutePlan());
    }else if(title == StringRes.marketAuditReport){
      _navigateTo(MarketAuditReport());
    }
  }

  void _onLogout() {
    SweetAlert.show(context,
        subtitle: StringRes.wantLogout,
        style: SweetAlertStyle.confirm,
        showCancelButton: true,
        onPress: (bool isConfirm) {
          if (isConfirm) {
            Navigator.pop(context);
            _navigateTo(Login());
            return false;
          }
        });
  }

  void _navigateTo(Widget route) async {
    NavigateTo.navigateTo(context: context, route: route);
  }
}

