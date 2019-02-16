import 'package:flutter/material.dart';
import 'package:sm_app/login/login.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sweetalert/sweetalert.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  Widget lblMenu(){
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Text(
        StringRes.menu,
        style: TextStyle(
          color: Colors.blueGrey,
          fontSize: FontSizeRes.title,
        ),
      ),
    );
  }

  Widget btnMenu(String title){
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Container(
        width: 345.0,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: click,
          padding: EdgeInsets.all(12),
          color: Colors.grey[300],
          child: Text(
              title,
              //textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: FontSizeRes.button
              )
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 6.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Row(
              children: <Widget>[
                lblMenu(),
                buildIconLogout()
              ],
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 16.0),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.grey[50]
                ),
                child: Column(
                  children: buildMenus(),
                )
            )
          ],
        ),
      ),
    );
  }

  Expanded buildIconLogout() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.red[200],
            ),
            onPressed: () {
              onLogout();
            },
          ),
        ],
      ),
    );
  }

  List<Widget> buildMenus() {
    return [
      btnMenu(StringRes.distributionTopup),
      btnMenu(StringRes.dailyRetailerMapping),
      btnMenu(StringRes.dailyFeedback),
      btnMenu(StringRes.dailySummary),
      btnMenu(StringRes.stockControlHistoryAgent),
      btnMenu(StringRes.stockControlReportTeamLeader),
      btnMenu(StringRes.routePlan),
      btnMenu(StringRes.marketAuditReport),
      btnMenu(StringRes.teamInfo),
    ];
  }

  void click() {
  }

  void onLogout() {
    SweetAlert.show(context,
        subtitle: StringRes.wantLogout,
        style: SweetAlertStyle.confirm,
        showCancelButton: true,
        onPress: (bool isConfirm) {
          if (isConfirm) {
            navigateTo();
            return false;
          }
        });
  }

  Future navigateTo() {
    Navigator.pop(context);
    return Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Login()));
  }
}

