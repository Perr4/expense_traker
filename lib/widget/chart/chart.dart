import 'package:flutter/material.dart';
import 'chart_bar.dart';
import 'package:expense_traker/model/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expense});

  final List<Expense> expense;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expense, Category.cibo),
      ExpenseBucket.forCategory(expense, Category.lavoro),
      ExpenseBucket.forCategory(expense, Category.svago),
      ExpenseBucket.forCategory(expense, Category.viaggi),
    ];
  }

  double get maxTotalExpense {
    double maxTotal = 0;
    for (final bucket in buckets) {
      maxTotal += bucket.totalExpense;
    }
    
    return maxTotal;
  }
  double val(var num){
    final numer = num/maxTotalExpense;
    if(numer == null){
      return 0.0;
    }
    return numer;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.onPrimary,
            Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.5),
          ],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: 
                  buckets.where((item)=>item.totalExpense/maxTotalExpense>=0.0).map((item)=>ChartBar(fill: item.totalExpense/maxTotalExpense)).toList()
            ,
            ),
          ),
          SizedBox(height: 12),
          Row(
            
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary.withValues(),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
