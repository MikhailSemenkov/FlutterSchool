import 'package:flutter/material.dart';

class Themes {
  static final theme = ThemeData(
    fontFamily: 'Anonymous Pro',
    scaffoldBackgroundColor: const Color(0xFF15202A),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF152233),
      shadowColor: Color(0xFF15212D),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF152233),
      contentTextStyle: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 17,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return const Color(0xFFD9A543);
          },
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          const Color(0xFFD9A543),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: const Color(0xFF15202A),
      headerBackgroundColor: const Color(0xFF36404D),
      todayBackgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return const Color(0xFFD9A543);
          }
          return Colors.transparent;
        },
      ),
      todayForegroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.black;
          }
          return const Color(0xFFD9A543);
        },
      ),
      dayBackgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return const Color(0xFFD9A543);
          }
          return Colors.transparent;
        },
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF36404D),
      secondary: Color(0xFFD9A543),
      background: Color(0xFF15202A),
      onBackground: Color(0xFF5990D9),
      error: Color(0xFFD9796F),
      onError: Color(0xFFD97738),
      tertiary: Color(0xFF4ED990),
      surface: Color(0xFF25255C),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 17,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
          fontFamily: 'Anonymous Pro',
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      labelMedium: TextStyle(
          fontFamily: 'Anonymous Pro',
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      labelSmall: TextStyle(
        fontFamily: 'Anonymous Pro',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
  );
}
