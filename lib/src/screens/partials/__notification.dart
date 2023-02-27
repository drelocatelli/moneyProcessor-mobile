import 'package:flutter/material.dart';

class Notify {
  
  static snackbar(BuildContext context, {required SnackBar snackbar}) {
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
  
}