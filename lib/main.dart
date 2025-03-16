import "package:expence_app/expenses_app/screens/expenses_screen.dart";
import "package:flutter/material.dart";

ColorScheme kColorScheme = ColorScheme.fromSeed(seedColor: Colors.purple);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        brightness: Brightness.dark,
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          elevation: 10,
          shadowColor: kColorScheme.shadow,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 18,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w700,
            color: kColorScheme.onPrimaryContainer,
            fontSize: 15,
          ),
        ),
      ),
      home: const ExpensesScreen(),
    ),
  );
}
