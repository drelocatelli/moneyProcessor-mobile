import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mp_mobile/themes.dart';
import 'package:mp_mobile/variables.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    
    final Themes theme = Themes(context);

    return MaterialApp.router(
      title: Variables.title,
      debugShowCheckedModeBanner: false,
      theme: theme.primary(),
      darkTheme: theme.dark(),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}

