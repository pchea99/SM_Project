import 'package:flutter/material.dart';
import 'package:sm_app/daily-distribution-topup/daily-distribution-topup.dart';
import 'package:sm_app/login/login.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/res/string-res.dart';
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
        centerTitle: true,
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
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: const EdgeInsets.only(top: 6.0),
        child: ListView(
          shrinkWrap: true,
          children: _menus.map((menu)=>
              Card(
                child: ListTile(
                  title: Text(menu),
                  onTap: (){
                    _click(menu);
                  },
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

