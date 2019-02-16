import 'package:flutter/material.dart';
import 'package:sm_app/daily-distribution-topup/daily-distribution-topup.dart';
import 'package:sm_app/login/login.dart';
import 'package:sm_app/menu/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      home: Login(),
    );
  }
}


