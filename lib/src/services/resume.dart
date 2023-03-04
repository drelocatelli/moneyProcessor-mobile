import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mp_mobile/src/services/authentication.dart';
import 'package:mp_mobile/src/services/dto/resume.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:mp_mobile/src/services/server.dart';
import 'package:mp_mobile/src/services/throwHttp.dart';

import '../screens/partials/__notification.dart';

class ResumeService {

  static Future<IResume?> index(BuildContext context, {String? start_date, String? end_date}) async {
    start_date = start_date ?? _startOfMonth();
    end_date = end_date ?? _endOfMonth();

    final token = await HandleAuthentication.getToken();

    final response = await http.get(
      Server.call(
        'resume', 
        queryParameters: {
          "start_date": start_date,
          "end_date": end_date
        }
      ),
      headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
      },
    );

    final json = jsonDecode(response.body);
    final data = IResume.fromJson(json);

    tryResponse(
      response, 
      onSuccess: () {}, 
      onError: () {
         Notify.snackbar(context, snackbar: SnackBar(content: Text("Não foi possível obter o resumo, tente novamente"), duration: Duration(seconds: 1)));
      }
    );

    return data;

  }

  static String _startOfMonth() {
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    String formattedDate = DateFormat('yyyy-MM-dd').format(startOfMonth);
    return formattedDate;
  }

  static String _endOfMonth() {
    DateTime now = DateTime.now();
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);
    String formattedDate = DateFormat('yyyy-MM-dd').format(endOfMonth);
    return formattedDate;
  }
  
}