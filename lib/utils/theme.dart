import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

ThemeData getTheme() {
  String _brightnessValue = PrefService.getString('brightness');
  Brightness _brightness = Brightness.light;
  if ( _brightnessValue == "dark")
    _brightness = Brightness.dark;

  String _colorValue = PrefService.getString('color');
  Color _color = Colors.blue;
  if ( _colorValue == "Green")
    _color = Colors.green;
  else if ( _colorValue == "Red")
    _color = Colors.red;

  return ThemeData(
    brightness: _brightness,
    primaryColor: _color,
  );
}