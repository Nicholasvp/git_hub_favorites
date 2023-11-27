import 'package:flutter/material.dart';

class AppText {
  static TextStyle bold(double size, {Color? color}) => TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: size,
      color: color ?? Colors.black);

  static TextStyle boldWhite(double size) => TextStyle(
      fontWeight: FontWeight.bold, fontSize: size, color: Colors.white);

  static TextStyle regular(double size, {Color? color}) => TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: size,
      color: color ?? Colors.black);

  static TextStyle regularWhite(double size) => TextStyle(
      fontWeight: FontWeight.normal, fontSize: size, color: Colors.white);
}
