import 'package:flutter/material.dart';

class HandleScreen extends ValueNotifier<bool> {

  HandleScreen(bool value) : super(value);

  void toggle() {
    value = !value;
  }

}