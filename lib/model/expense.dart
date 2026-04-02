//comment
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { cibo, viaggi, lavoro, svago }

const categoryIcons = {
  Category.cibo: Icons.lunch_dining,
  Category.viaggi: Icons.flight_takeoff,
  Category.svago: Icons.movie,
  Category.lavoro: Icons.work,
};

class Expense {
  Expense({
    required this.amount,
    required this.date,
    required this.title,
    required this.tipo,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category tipo;

  String get fomattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
    : expenses = allExpense.where((item) => item.tipo == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpense {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
