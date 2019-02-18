import 'package:flutter/material.dart';

class SpinnerDialog{
  static void onSpinner(BuildContext context) {
     showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return Center(child: new CircularProgressIndicator());
      },
    );
  }
}