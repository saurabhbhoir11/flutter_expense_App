import 'package:flutter/material.dart';
import 'package:expence_app/expenses_app/models/expense.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'expense1',
      amount: 100,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'expense2',
      amount: 200,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(title: Text('Expenses Application')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Expenses Application.',
              textAlign: TextAlign.center,
            ),
            Text('This the the Home Screen.', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
