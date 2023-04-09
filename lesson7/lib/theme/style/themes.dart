import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  static final darkTheme = ThemeData(
    primaryColor: Colors.green,
    colorScheme: ColorScheme.dark(
      primary: Colors.black.withOpacity(0.26),
      secondary: Colors.black.withOpacity(0.12),
      tertiary: const Color(0xff333333),
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return Colors.white;
          },
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Colors.grey.shade800.withOpacity(0.75)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(const BorderSide(color: Colors.grey)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    sliderTheme: const SliderThemeData(
      thumbColor: Colors.white,
      activeTrackColor: Colors.white,
      inactiveTrackColor: Color(0x55777777),
    ),
    appBarTheme:
        const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
    navigationBarTheme: NavigationBarThemeData(
      surfaceTintColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      iconTheme: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(color: Colors.white);
          }
          return const IconThemeData(
            color: Colors.grey,
          );
        },
      ),
    ),
    useMaterial3: true,
  );

  static final lightTheme = ThemeData(
    primaryColor: Colors.green,
    colorScheme: ColorScheme.light(
      primary: Colors.grey.withOpacity(0.5),
      secondary: Colors.grey.withOpacity(0.15),
      tertiary: Colors.black.withOpacity(0.05),
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      headlineLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return Colors.black;
          },
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green.shade100),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(const BorderSide(color: Colors.green)),
        backgroundColor: MaterialStateProperty.all(Colors.green.shade50),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.grey,
    ),
    sliderTheme: const SliderThemeData(
      thumbColor: Colors.black,
      activeTrackColor: Colors.black,
      inactiveTrackColor: Color(0x55777777),
    ),
    appBarTheme:
        const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
    navigationBarTheme: NavigationBarThemeData(
      surfaceTintColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      iconTheme: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(color: Colors.black);
          }
          return const IconThemeData(
            color: Colors.grey,
          );
        },
      ),
    ),
    useMaterial3: true,
  );
}
