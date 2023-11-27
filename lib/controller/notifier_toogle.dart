import 'package:flutter/material.dart';

class NotifierToogle extends ValueNotifier<bool> {
  NotifierToogle(bool value) : super(value);

  void toggleValue() {
    value = !value;
  }
}
