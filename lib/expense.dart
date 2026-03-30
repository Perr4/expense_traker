//comment
import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Category { cibo, viaggi, lavoro, svago }

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
}
