import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError("SharedPreferences not injected");
});

class ThemeState {
  final bool isDark;
  const ThemeState({required this.isDark});
}

class ThemeNotifier extends Notifier<ThemeState> {
  static const _key = "isDarkMode";

  @override
  ThemeState build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final saved = prefs.getBool(_key) ?? false;
    return ThemeState(isDark: saved);
  }

  Future<void> setDarkMode(bool value) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool(_key, value);
    state = ThemeState(isDark: value); // ✅ notifyListeners 대신 이 한 줄
  }

  Future<void> toggle() => setDarkMode(!state.isDark);
}

final themeProvider = NotifierProvider<ThemeNotifier, ThemeState>(
  ThemeNotifier.new,
);
