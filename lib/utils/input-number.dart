import 'package:flutter/material.dart';
import 'package:sm_app/res/font-size-res.dart';

class InputNumber{
  static Widget buildTextField({
    TextEditingController controller,
    String label,
    bool isEnable
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextField(
        textAlign: TextAlign.right,
        keyboardType: TextInputType.number,
        controller: controller,
        enabled: isEnable == null ? false : isEnable,
        style: TextStyle(
            fontSize: FontSizeRes.normal
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              fontSize: FontSizeRes.normal
          ),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}