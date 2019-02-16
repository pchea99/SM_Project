import 'package:flutter/material.dart';

class AppBarUtil extends StatefulWidget {
  final String title;
  final List<Widget> actions;
  final Widget body;

  AppBarUtil({
    this.title,
    this.actions,
    this.body
  });

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        actions: widget.actions,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: onPressed
        ),
      ),
      body: Container(
        child: widget.body,
      ),
    );
  }

  void onPressed(){
    Navigator.pop(context);
  }
}

