import 'package:flutter/material.dart';
import '../../../variables.dart';
import '__calendar.dart';

class Header extends StatefulWidget {
  final Widget body;

  const Header({super.key, required this.body});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Variables.title),
          ],
        ),
      ),
      body: widget.body,
    );
  }
}