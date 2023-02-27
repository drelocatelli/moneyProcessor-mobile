import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

dynamic tryResponse(Response response, {required VoidCallback onSuccess, required VoidCallback onError}) {

  if(response.statusCode <= 226) {
    onSuccess();
    
  } else if(response.statusCode >= 400) {
    onError();
  }
}