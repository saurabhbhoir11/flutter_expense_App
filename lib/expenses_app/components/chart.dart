import 'package:expence_app/expenses_app/components/chart_bar.dart';
import 'package:expence_app/expenses_app/models/expense.dart';
import 'package:expence_app/expenses_app/models/expense_bucket.dart';
import 'package:expence_app/main.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (ExpenseBucket bucket in buckets) {
      if (bucket.totalExpense > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpense;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    //used if we chenge theme based on system theme
    // final bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    // used to check whethet user has selected dark mode
    final bool isDarkMode = MyApp.themeNotifier.value == ThemeMode.dark;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withAlpha(110),
            Theme.of(context).colorScheme.primary.withAlpha(0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final ExpenseBucket bucket in buckets)
                  ChartBar(
                    fill:
                        bucket.totalExpense == 0
                            ? 0
                            : bucket.totalExpense / maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children:
                buckets
                    .map(
                      (bucket) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            categoryIcons[bucket.category],
                            color:
                                isDarkMode
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(
                                      context,
                                    ).colorScheme.primary.withAlpha(180),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
