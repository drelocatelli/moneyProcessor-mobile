import 'package:flutter/material.dart';


class Calendar {

  final BuildContext context;

  Calendar(this.context);

  void __calendarDialog() {
    showDialog(
      context: context, 
      builder: (ctx) {
        return AlertDialog(
          title: Text("Selecione a data do resumo"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                SelectableText("to do")
              ],
            ),
          ),
        );
      }
    );
  }

  Widget widget() {
    return IconButton(onPressed: () => this.__calendarDialog(), icon: Icon(Icons.date_range));
  }
  
}