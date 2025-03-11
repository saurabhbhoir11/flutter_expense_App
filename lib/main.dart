import "package:expence_app/expenses_app/screens/expenses_screen.dart";
import "package:flutter/material.dart";

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesScreen(),
    ),
  );
}
