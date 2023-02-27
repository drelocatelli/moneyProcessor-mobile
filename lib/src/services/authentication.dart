import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mp_mobile/src/services/server.dart';
import 'package:mp_mobile/src/services/dto/authentication.dart';

class Authentication {

  static Future<IAuthentication?> login({required String login, required String password}) async {
    try {
      final json = jsonEncode({
        'email': '$login',
        'password': '$password'
      });

      final response = await http.post(
        Server.call('auth/login'),
        headers: {"Content-Type": "application/json"},
        body: json
      );
      
      final data = jsonDecode(response.body);
      return IAuthentication.fromJson(data);

    } catch(err) {
      debugPrint("err: $err");
    }
  }
  
}