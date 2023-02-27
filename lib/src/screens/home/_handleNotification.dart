import 'package:flutter/material.dart';

class HandleNotification extends ValueNotifier<String> {
  HandleNotification(String value) : super(value);

  void set(String value) {
    this.value = value;
  }
  
}