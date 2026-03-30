import 'package:expense_traker/model/expense.dart';
import 'package:expense_traker/widget/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "flutter Curse",
      amount: 19.99,
      date: DateTime.now(),
      tipo: Category.lavoro,
    ),
    Expense(
      title: "Game",
      amount: 15.30,
      date: DateTime.now(),
      tipo: Category.svago,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
         
          children: [
            Text("data"),
            Expanded(child: ExpensesList(expenses: _registeredExpenses)),
          ],
        ),
      ),
    );
  }
}
