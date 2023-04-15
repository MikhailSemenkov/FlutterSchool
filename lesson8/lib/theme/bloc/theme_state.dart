part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  late final ThemeData themeData;
  final bool isDark;

  ThemeState(this.isDark) {
    if (isDark) {
      themeData = Themes.darkTheme;
    } else {
      themeData = Themes.lightTheme;
    }
  }
}

class ThemeInitial extends ThemeState {
  ThemeInitial(super.isDark);
}

class DarkThemeState extends ThemeState {
  DarkThemeState() : super(true);
}

class LightThemeState extends ThemeState {
  LightThemeState() : super(false);
}

class LoadingThemeState extends ThemeState {
  LoadingThemeState() : super(false);
}
