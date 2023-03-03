import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mp_mobile/src/screens/partials/__notification.dart';
import 'package:mp_mobile/src/services/dto/register.dart';
import 'package:mp_mobile/src/services/server.dart';
import 'package:mp_mobile/src/services/dto/authentication.dart';
import 'package:mp_mobile/src/services/throwHttp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HandleAuthentication {

  static Future<SharedPreferences> database() async {
    final config = await SharedPreferences.getInstance();
    return config;
  }

  static storeToken(String token) async {
    final db = await database();
    db.setString('token', token);
    Modular.to.pushNamedAndRemoveUntil('/dashboard', (p0) => false);
  }

  static printToken() async {
    final db = await database();
    final token = db.getString('token');
    debugPrint("Stored token: ${token}");
  }

  static handlePermission() async {
    final db = await database();
    printToken();
    
    if(db.getString('token') != null) {
      return Modular.to.pushNamedAndRemoveUntil('/dashboard', (p0) => false);
    }
  }

  static destroyToken() async {
    final db = await database();
    printToken();
    db.remove('token');
    Modular.to.pushNamedAndRemoveUntil('/', (p0) => false);
  }

}

class Authentication {

  static Future<IAuthentication?> login(BuildContext ctx, {required String login, required String password, bool saveLogin = false}) async {
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
        onSuccess: () async {
          Notify.snackbar(ctx, 
            snackbar: SnackBar(
              content: Text("${data.message}"),
              duration: Duration(seconds: 1),
            )
          );
          debugPrint("Save login: $saveLogin");
          if(saveLogin) {
            HandleAuthentication.storeToken(data.token as String);
          }
          Modular.to.pushNamedAndRemoveUntil('/dashboard', (p0) => false);
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
          HandleAuthentication.storeToken(data.token as String);
          Modular.to.pushNamedAndRemoveUntil('/dashboard', (p0) => false);
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
