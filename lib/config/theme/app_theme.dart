import 'package:flutter/material.dart';

//Default properties theme
const Color _customColor = Color(0xFF441082);

const List<Color> _listCustomColor = [
  _customColor,
  Colors.yellowAccent,
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
  Colors.orangeAccent,
  Colors.deepPurpleAccent,
  Colors.cyanAccent
];

class AppTheme {
  //Propertie for selected color
  int selectedColor = 0;

  //Constructor for selected color
  AppTheme({this.selectedColor = 0})
      : assert(
            selectedColor >= 0 && selectedColor <= _listCustomColor.length - 1,
            "Color must be between 0 and ${_listCustomColor.length - 1}");

  //Metodos y funciones
  ThemeData miTemitaSocito() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _listCustomColor[selectedColor]);
  }
}
