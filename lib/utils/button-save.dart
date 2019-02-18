import 'package:flutter/material.dart';
import 'package:sm_app/res/string-res.dart';

class ButtonSave{
  static Widget buttonSave(VoidCallback callback){
    return FlatButton(
        onPressed: callback,
        child: Text(
          StringRes.save,
          style: TextStyle(
            color: Colors.white
          ),
        )
    );
  }
}