import 'package:flutter/material.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/res/string-res.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  Widget _lblMenu(){
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Text(
        StringRes.menu,
        style: TextStyle(
          color: Colors.blueGrey[100],
          fontSize: FontSizeRes.title,
        ),
      ),
    );
  }

  Widget _btnMenu(String title){
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: ButtonTheme(
        minWidth: 300.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: _click,
          padding: EdgeInsets.all(12),
          color: Colors.blueGrey[300],
          child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
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
          children: <Widget>[
            _lblMenu(),
            Container(
              height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.blueGrey[50]
                ),
                child: Column(
                  children: <Widget>[
                    _btnMenu(StringRes.distributionTopup),
                    _btnMenu(StringRes.distributionTopup),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  void _click() {
  }
}
