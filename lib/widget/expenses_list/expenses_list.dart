import 'dart:ui';

import 'package:expense_traker/model/expense.dart';
import 'package:expense_traker/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.remouveExpese, {super.key, required this.expenses});

  final void Function(Expense exp) remouveExpese;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,

      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.40),
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (dir){
          remouveExpese(expenses[index]);
        },
        child: ExpensesItem(expense: expenses[index]),
      ),
    );
  }
}
