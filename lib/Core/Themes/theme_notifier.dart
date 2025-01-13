import 'package:bookly_flutter_app/Core/Themes/themes_manager.dart';
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Notifies all listeners when the theme changes
  }

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;
}
