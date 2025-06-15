import 'package:flutter/material.dart';

class Funcs {
  static bool isValueNull(String? val) {
    return val == null;
  }

  static Widget spaces(double val) {
    return SizedBox(height: val);
  }

  static Widget dividers(double val) {
    return SizedBox(width: val);
  }
}
