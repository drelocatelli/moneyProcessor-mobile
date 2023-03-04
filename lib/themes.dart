import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {

  final BuildContext context;
  
  Themes(this.context);

  ThemeData primary() {

    final textTheme = Theme.of(context).textTheme;
    
    return ThemeData(
      primaryColor: Colors.red,
      textTheme: GoogleFonts.poppinsTextTheme(),
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