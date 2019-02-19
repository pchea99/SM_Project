import 'package:flutter/material.dart';
import 'package:sm_app/res/font-size-res.dart';

class SelectList{
  static Widget selectList({String label, String value, VoidCallback callback}){
    return InkWell(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[100]),
            borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            top: 12.0,
            bottom: 12.0
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: FontSizeRes.normal
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  value == null ? "" : value,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: FontSizeRes.normal
                  ),
                ),
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.grey,
              )
            ],
          )
        ),
      ),
    );
  }
}