import 'package:flutter/material.dart';

const int _primary = 0xFF5666F0;
const int _gray = 0xFFD5D5DA;
const int _error = 0xDA2323FF;

const MaterialColor primary = MaterialColor(_primary, <int, Color>{
  300: Color(0xFFBCC3FF),
  500: Color(_primary),
});

const MaterialColor gray = MaterialColor(_gray, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(0xFFEFF1F5),
  300: Color(0xFFF6F7FB),
  400: Color(0xFFEFF1F5),
  500: Color(_gray),
  600: Color(0xFF9E9E9E),
  700: Color(0xFF8A8A8D),
  800: Color(0xFF3A4045),
  850: Color(0xFF353535),
  900: Color(0xFF272727),
  950: Color(0xFF000000),
});

const MaterialColor error = MaterialColor(_error, <int, Color>{
  300: Color(0xFFFD7979),
  500: Color(_primary),
});
