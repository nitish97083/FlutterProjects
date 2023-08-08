import 'package:expense_tracker/DataModel/expense.dart';
import 'package:expense_tracker/widget/expenseList/expenseItem.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({super.key, required this.expensesList});
  final List<Expense> expensesList;

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.expensesList.length,
        itemBuilder: (ctx, index) {
          return ExpenseItem(expense: widget.expensesList[index]);
        });
  }
}
