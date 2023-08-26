import 'package:expense_tracker/DataModel/expense.dart';
import 'package:expense_tracker/chart/chart.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

import 'expenseList/expenseList.dart';

class Expenese extends StatefulWidget {
  const Expenese({super.key});

  @override
  State<Expenese> createState() => _ExpeneseState();
}

class _ExpeneseState extends State<Expenese> {
  final List<Expense> _registerExpenses = [
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

  _addExpenses(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  _removeExpenses(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          content: const Text("Expense Deleted"),
          action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                setState(() {
                  _registerExpenses.insert(expenseIndex, expense);
                });
              }),
        ),
      );
    });
  }

  _openAddExpenseSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(addOnExpense: _addExpenses),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(" No Expenses found! Please start adding some"),
    );
    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expensesList: _registerExpenses,
        onRemoveExpense: _removeExpenses,
      );
    }
    final width = MediaQuery.of(context).size.width;
    final hieght = MediaQuery.of(context).size.height;
    print(" width $width and $hieght ");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        elevation: 0.5,
        actions: [
          IconButton(
              onPressed: _openAddExpenseSheet, icon: const Icon(Icons.add)),
        ],
      ),
      body: width < 450
          ? Column(
              children: [
                Chart(expenses: _registerExpenses),
                mainContent,
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registerExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
