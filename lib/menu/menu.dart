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

  Widget _lblMenu(){
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

  Widget _btnMenu(String title){
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Container(
        width: 345.0,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: _click,
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
                _lblMenu(),
                _buildIconLogout()
              ],
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 16.0),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.grey[50]
                ),
                child: Column(
                  children: _buildMenus(),
                )
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildIconLogout() {
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
              _onLogout();
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMenus() {
    return [
      _btnMenu(StringRes.distributionTopup),
      _btnMenu(StringRes.dailyRetailerMapping),
      _btnMenu(StringRes.dailyFeedback),
      _btnMenu(StringRes.dailySummary),
      _btnMenu(StringRes.stockControlHistoryAgent),
      _btnMenu(StringRes.stockControlReportTeamLeader),
      _btnMenu(StringRes.routePlan),
      _btnMenu(StringRes.marketAuditReport),
      _btnMenu(StringRes.teamInfo),
    ];
  }

  void _click() {
  }

  void _onLogout() {
    SweetAlert.show(context,
        subtitle: StringRes.wantLogout,
        style: SweetAlertStyle.confirm,
        showCancelButton: true,
        onPress: (bool isConfirm) {
          if (isConfirm) {
            _navigateTo();
            return false;
          }
        });
  }

  Future _navigateTo() {
    Navigator.pop(context);
    return Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Login()));
  }
}

