import 'package:expense_tracker/DataModel/expense.dart';
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
    setState(() {
      _registerExpenses.remove(expense);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(66, 79, 79, 79),
        title: const Text("Expense Tracker"),
        elevation: 0.5,
        actions: [
          IconButton(
              onPressed: _openAddExpenseSheet, icon: const Icon(Icons.add)),
        ],
      ),
      body: mainContent,
    );
  }
}
