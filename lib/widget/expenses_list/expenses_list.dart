import 'package:expense_traker/model/expense.dart';
import 'package:expense_traker/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensesList({super.key, required this.expenses});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpensesItem(expense: expenses[index]),
    );
  }
}
