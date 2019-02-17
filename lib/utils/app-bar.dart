import 'package:flutter/material.dart';

class AppBarUtil extends StatefulWidget {
  final String title;
  final List<Widget> actions;
  final Widget layout;

  AppBarUtil({
    this.title,
    this.actions,
    this.layout
  });

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBarUtil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white
          ),
        ),
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
        child: widget.layout,
      ),
    );
  }

  void onPressed(){
    Navigator.pop(context);
  }
}

