import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mp_mobile/src/screens/partials/__notification.dart';
import 'package:mp_mobile/src/services/dto/user.dart';
import 'package:http/http.dart' as http;
import 'package:mp_mobile/src/services/server.dart';
import 'package:mp_mobile/src/services/throwHttp.dart';

class UserService {
  
  static Future<User?> get(BuildContext context, {required String token}) async {
    final response = await http.get(
      Server.call('user'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }
    );

    final data = User.fromJson(jsonDecode(response.body));

    tryResponse(
      response, 
      onSuccess: () { }, 
      onError: () {
        Notify.snackbar(context, snackbar: SnackBar(content: Text("Não foi possível obter dados de usuário, tente novamente"), duration: Duration(seconds: 1)));
      }
    );

    return data;
    
  }
  
}