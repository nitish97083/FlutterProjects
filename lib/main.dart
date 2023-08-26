import 'package:expense_tracker/widget/expenses.dart';
import 'package:flutter/material.dart';

var custColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var custDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: custColorScheme,
        useMaterial3: true,
        cardTheme: const CardTheme().copyWith(
          color: custDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: custDarkColorScheme.secondaryContainer,
          foregroundColor: custDarkColorScheme.onSecondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: custDarkColorScheme.primaryContainer,
            foregroundColor: custDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      //  themeMode: ThemeMode.light, // dark them close
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: custColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: custColorScheme.onPrimaryContainer,
          foregroundColor: custColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: custColorScheme.onSecondary,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: custColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: custColorScheme.onSecondaryContainer,
              ),
              titleMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: custColorScheme.onSecondaryContainer,
              ),
              titleSmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: custColorScheme.onBackground,
              ),
            ),
      ),
      // themeMode: ThemeMode.dark, it defualt
      home: const Expenese(),
    ),
  );
}
