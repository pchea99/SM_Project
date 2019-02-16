import 'package:flutter/material.dart';

class AppBarUtil extends StatefulWidget {
  final String title;
  final List<Widget> actions;

  AppBarUtil({
    this.title,
    this.actions
  });

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title,
      actions: widget.actions,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: onPressed
      ),
    );
  }

  void onPressed(){
    Navigator.pop(context);
  }
}
