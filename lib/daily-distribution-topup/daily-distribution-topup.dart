import 'package:flutter/material.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';

class DailyDistributionTopUp extends StatefulWidget {
  @override
  _DailyDistributionTopUpState createState() => _DailyDistributionTopUpState();
}

class _DailyDistributionTopUpState extends State<DailyDistributionTopUp> {

  Widget txtPosition(){
    return TextField(
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(
          fontSize: FontSizeRes.normal
      ),
      /*decoration: InputDecoration(
        hintText: StringRes.position,
        hintStyle: TextStyle(
            fontSize: FontSizeRes.normal
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),*/
      onChanged: (_){

      },
    );
  }

  Widget lblTeam(){
    return Text(
      StringRes.team,
      style: TextStyle(
        fontSize: FontSizeRes.normal
      ),
    );
  }

  Widget rowContain(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey[50]),
        borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildTextField(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.dailyDistributionTopUp,
      layout: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            rowContain(),
          ],
        ),
      ),
    );
  }

  TextField buildTextField() {
    return TextField(
            style: TextStyle(
              fontSize: FontSizeRes.normal
            ),
            decoration: InputDecoration(
              labelText: "Details",
              labelStyle: TextStyle(
                fontSize: FontSizeRes.normal
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          );
  }
}
