import 'package:flutter/material.dart';

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

const MaterialColor primaryWhite = MaterialColor(
  _whitePrimaryValue,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(_whitePrimaryValue),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
const int _whitePrimaryValue = 0xFFFFFFFF;

ThemeData lightTheme = ThemeData(
  primarySwatch: primaryBlack,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryWhite,
    foregroundColor: primaryBlack,
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: primaryWhite,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    foregroundColor: primaryWhite,
  ),
);

class ThemeModel extends ChangeNotifier {
  bool _isDark = true;
  bool get isDark {
    return _isDark;
  }

  void toggle() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
