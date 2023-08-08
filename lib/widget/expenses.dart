import 'package:expense_tracker/DataModel/expense.dart';
import 'package:flutter/material.dart';

import 'expenseList/expenseList.dart';

class Expenese extends StatefulWidget {
  const Expenese({super.key});

  @override
  State<Expenese> createState() => _ExpeneseState();
}

class _ExpeneseState extends State<Expenese> {
  final List<Expense> _addExpenses = [
    Expense(
        title: "Office Work",
        ammount: 200.0,
        dateTime: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Pitzza",
        ammount: 10.0,
        dateTime: DateTime.now(),
        category: Category.food)
  ];

  @override
  Widget build(BuildContext context) {
    return ExpenseList(
      expensesList: _addExpenses,
    );
  }
}
