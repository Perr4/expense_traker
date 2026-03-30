import 'package:expense_traker/model/expense.dart';
import 'package:flutter/material.dart';


class ExpensesItem extends StatelessWidget {
  const ExpensesItem({required this.expense, super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
         
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),   Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.tipo]),
                    const SizedBox(width: 8),
                    Text(expense.fomattedDate),
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
