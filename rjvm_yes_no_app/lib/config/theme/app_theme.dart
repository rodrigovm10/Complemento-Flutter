import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF6F0080);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'El color se debe encontrar entre 0 y ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colorThemes[0]);
  }
}
