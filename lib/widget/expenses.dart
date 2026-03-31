import 'package:expense_traker/model/expense.dart';
import 'package:expense_traker/widget/expenses_list/expenses_list.dart';
import 'package:expense_traker/widget/new_expenses.dart';
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


  void _openAddExpenseOverlay(){
    showModalBottomSheet(isScrollControlled: true,context: context, builder:(ctx)=> NewExpenses(_addExpense));
   
  }
  void _addExpense(Expense exp){
    setState(() {
      _registeredExpenses.add(exp);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Expenses Tracker"),
        actions: [IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          Text("data"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
