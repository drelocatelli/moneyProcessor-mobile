import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mp_mobile/src/screens/partials/__notification.dart';
import 'package:mp_mobile/src/services/dto/register.dart';
import 'package:mp_mobile/src/services/server.dart';
import 'package:mp_mobile/src/services/dto/authentication.dart';
import 'package:mp_mobile/src/services/throwHttp.dart';

class Authentication {

  static Future<IAuthentication?> login(BuildContext ctx, {required String login, required String password}) async {
      final json = jsonEncode({
        'email': '$login',
        'password': '$password'
      });

      final response = await http.post(
        Server.call('auth/login'),
        headers: {"Content-Type": "application/json"},
        body: json
      );

      final data = IAuthentication.fromJson(jsonDecode(response.body));

      debugPrint(data.message);
      
      tryResponse(
        response, 
        onSuccess: () {
          Notify.snackbar(ctx, 
          snackbar: SnackBar(
            content: Text("${data.message}"),
            duration: Duration(seconds: 1),
          )
        );
        }, 
        onError: () {
          Notify.snackbar(
            ctx, 
            snackbar: SnackBar(
              content: Text("${data.message}"),
              duration: Duration(seconds: 1),
            )
          );
        }
      );

      return data;
  
  }

  static Future<IAuthentication?> register(BuildContext ctx, {required IRegister register}) async {
    try {
      final response = await http.post(
        Server.call('auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(register.toJSON())
      );

      final data = IAuthentication.fromJson(jsonDecode(response.body));

      tryResponse(response, 
        onSuccess: () {
          Notify.snackbar(ctx , snackbar: SnackBar(
            content: Text("Conta criada com sucesso")
          ));
        }, 
        onError: () {
          Notify.snackbar(
            ctx, 
            snackbar: SnackBar(
              content: Text("${data.message}")
            )
          );
        }
      );

      return data;

    } catch(err) {
      debugPrint("err: $err");
    }
    
  }
  
}