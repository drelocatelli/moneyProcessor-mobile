import 'package:flutter/material.dart';
import 'package:mp_mobile/src/screens/home/register.dart';
import 'package:mp_mobile/src/screens/partials/__header.dart';

import '_handleScreen.dart';
import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final HandleScreen _isLoginScreen = HandleScreen(true);

  @override
  Widget build(BuildContext context) {
    return  Header(
      body: ValueListenableBuilder(
        valueListenable: _isLoginScreen,
        builder: (ctx, value, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: value ? LoginScreen(isLoginScreen: _isLoginScreen) : RegisterScreen(isLoginScreen: _isLoginScreen)
          );
        },
      ),
    );
  }
  
}