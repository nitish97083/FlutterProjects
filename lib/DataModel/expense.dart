import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisue, work }

final formatter = DateFormat.yMd();

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.leisue: Icons.movie_creation_outlined,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.ammount,
      required this.dateTime,
      required this.category})
      : id = uuid.v4();
  final String id;
  final double ammount;
  final DateTime dateTime;
  final String title;
  final Category category;

  String getfommaterTime() {
    return formatter.format(dateTime);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();

  double get totaEexpenseAmount {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.ammount;
    }
    return sum;
  }
}
