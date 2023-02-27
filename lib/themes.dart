import 'package:flutter/material.dart';

class Themes {

  final BuildContext context;
  
  Themes(this.context);

  ThemeData primary() {
    return ThemeData(
      primaryColor: Colors.red,
      // pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(),}),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white, 
      ),
    );
  }

  ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.white,
    );
  }
  
}