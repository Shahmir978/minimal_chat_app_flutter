import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Themes/Light_Mode.dart';
import 'package:minimal_chat_app_flutter/Themes/dark_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

set themeData(ThemeData themeData){
  _themeData = themeData;
  notifyListeners();
}
 void toggleTheme(){
  if (themeData == lightMode) {
    themeData = darkMode;
  }
  else {
    themeData = lightMode;
  }
 }
}