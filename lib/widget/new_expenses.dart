
import 'package:expense_traker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpenses extends StatefulWidget {
  const NewExpenses(this.onAddExpense, {super.key});

final Function(Expense) onAddExpense;
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime? _selectedTime;
  Category _selectedCategory = Category.svago;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedTime = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
  
    super.dispose();
  }

  void _submitExpensesData() {
    final cost = double.tryParse(_priceController.text);
    final isAmmountinValid = (cost == null || cost <= 0);
    if (_titleController.text.trim().isEmpty ||
        isAmmountinValid ||
        _selectedTime == null) {
          
          //ERROR DIALOG
      showDialog(
        context: context,
        builder: (item) => AlertDialog(
          content: const Text(
            "Please make sure you insert every information needed",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("close"),
            ),
          ],
        ),
      );
      return;
    }
    final expens = Expense(amount: cost, date:_selectedTime!, title: _titleController.text, tipo: _selectedCategory);
    widget.onAddExpense(expens);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(50),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  maxLength: 10,
                  controller: _priceController,

                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    label: Text("Price"),
                    prefixText: '\$ ',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedTime == null
                          ? "Select Time"
                          : formatter.format(_selectedTime!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toString().toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Canel'),
              ),
              ElevatedButton(
                onPressed: _submitExpensesData,
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
