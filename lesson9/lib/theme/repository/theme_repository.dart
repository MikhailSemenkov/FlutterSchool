import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  Future<bool> getTheme() {
    return SharedPreferences.getInstance()
        .then((preferences) => preferences.getBool('isDark') ?? true);
  }

  Future<void> setTheme(bool isDark) {
    return SharedPreferences.getInstance()
        .then((preferences) => preferences.setBool('isDark', isDark));
  }
}
