import 'package:expense_tracker/DataModel/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Text(expense.title),
          Row(
            children: [
              Text('\$${expense.ammount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  Text(expense.getfommaterTime())
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
