import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeViewModel extends ChangeNotifier {
  static const _key = "isDarkMode";

  final SharedPreferences _prefs;

  bool _isDarkMode;
  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeViewModel(this._prefs) : _isDarkMode = _prefs.getBool(_key) ?? false;

  void setDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool(_key, value);
    notifyListeners(); // ✅ 이거 필수
  }

  void toggle() => setDarkMode(!_isDarkMode);
}
