//comment
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();
final formatter = DateFormat.yMd();
enum Category { cibo, viaggi, lavoro, svago }
const categoryIcons = {
Category.cibo : Icons.lunch_dining,
Category.viaggi : Icons.flight_takeoff,
Category.svago : Icons.movie,
Category.lavoro : Icons.work,
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

  String get fomattedDate{
    return formatter.format(date);
  }
}
