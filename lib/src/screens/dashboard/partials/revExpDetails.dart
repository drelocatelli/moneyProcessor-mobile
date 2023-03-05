import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mp_mobile/src/services/dto/resume.dart';

class RevExPDetails {

  static void getDetails(BuildContext context, Revenues? data) {
    showDialog(
      context: context, 
      builder: (ctx) {
        return AlertDialog(
          actionsPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          title: Text("Detalhes"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText("Quantidade:", style: TextStyle(fontWeight: FontWeight.bold)),
                    SelectableText("${data?.quantity}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText("Média:", style: TextStyle(fontWeight: FontWeight.bold)),
                    SelectableText("R\$ ${data?.average}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText("Total:", style: TextStyle(fontWeight: FontWeight.bold)),
                    SelectableText("R\$ ${data?.total}"),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Modular.to.pop(), child: Text("Concluído")),
          ],
        );
      }
    );
  }
  
}