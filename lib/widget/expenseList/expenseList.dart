import 'package:expense_tracker/DataModel/expense.dart';
import 'package:expense_tracker/chart/chart.dart';
import 'package:expense_tracker/widget/expenseList/expenseItem.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList(
      {super.key, required this.expensesList, required this.onRemoveExpense});
  final List<Expense> expensesList;
  final void Function(Expense expense) onRemoveExpense;

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: ListView.builder(
          itemCount: widget.expensesList.length,
          itemBuilder: (ctx, index) {
            return Dismissible(
                background: Container(
                  margin: Theme.of(context).cardTheme.margin,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(10)),
                ),
                onDismissed: (direction) {
                  widget.onRemoveExpense(widget.expensesList[index]);
                },
                key: ValueKey(widget.expensesList[index]),
                child: ExpenseItem(expense: widget.expensesList[index]));
          }),
    );
  }
}
