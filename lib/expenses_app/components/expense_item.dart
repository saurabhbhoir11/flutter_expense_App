import 'package:expence_app/expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // color: const Color(0xfffffbed),
      // elevation: 10,
      // shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
        child: Column(
          children: [
            Text(
              expense.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  expense.amount.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 15),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 5),
                    Text(
                      expense.formattedDate,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
