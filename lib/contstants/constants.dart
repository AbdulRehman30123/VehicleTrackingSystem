import 'package:flutter/material.dart';

Color splashscaffoldcolor = const Color(0xff2a9f91);
Color scaffoldcolor = Colors.white;
Color iconcolor = const Color(0xff033e3e);
Color cardcolor = const Color(0xff20b2aa);

TextStyle? textStyle = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 25,
  fontStyle: FontStyle.italic,
  shadows: [
    Shadow(
      blurRadius: 10.0, // shadow blur
      color: Color(0xff033e3e), // shadow color
      offset: Offset(2.0, 8.0), // how much shadow will be shown
    ),
  ],
);
