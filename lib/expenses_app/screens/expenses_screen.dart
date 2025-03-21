import 'package:expence_app/expenses_app/components/chart.dart';
import 'package:expence_app/expenses_app/components/expenses_list.dart';
import 'package:expence_app/expenses_app/components/new_expense.dart';
import 'package:expence_app/main.dart';
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
      title: 'expense10',
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
  void _showAddExpenseScreen() {
    showModalBottomSheet(
      useSafeArea: true,
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Expense Added!')));
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted!'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // print(MediaQuery.of(context).size.width);
    // print(MediaQuery.of(context).size.height);

    Widget mainContent = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'No Expense Found Start Adding Some!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: _showAddExpenseScreen,
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemovedExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Application'),
        actions: [
          Switch(
            value: MyApp.themeNotifier.value == ThemeMode.dark,
            onChanged: (value) {
              setState(() {
                MyApp.themeNotifier.value =
                    value ? ThemeMode.dark : ThemeMode.light;
              });
            },
          ),
          const SizedBox(width: 5),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20),
            onPressed: _showAddExpenseScreen,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body:
          width < 600
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(child: mainContent),
                ],
              )
              : Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(child: mainContent),
                ],
              ),
    );
  }
}
