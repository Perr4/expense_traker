import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpenses> {
  var _savedTitle = '';

  void _onChaningTitle(String val) {
    _savedTitle = val;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(50),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
            onChanged: _onChaningTitle,
          ),
          Row(
            children: [
              ElevatedButton(onPressed: (){}, child: const Text("Save Expense"))
            ],
          )
        ],
      ),
    );
  }
}
