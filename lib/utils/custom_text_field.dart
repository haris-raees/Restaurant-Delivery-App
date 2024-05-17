import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labText;
  final TextInputType? keyboardType;
  CustomTextField({this.controller, this.keyboardType, this.labText});
  @override
  Widget build(BuildContext context) {
    return TextField(
        minLines: 1,
        maxLines: 6,
        style: TextStyle(color: Colors.white),
        // style: TextStyle(color: Colors.white),
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          labelText: labText,
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ));
  }
}
