import 'package:flutter/material.dart';

const textFiledInputDecoration = InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2),
  ),
  labelText: "Email",
  labelStyle:
      TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
);
