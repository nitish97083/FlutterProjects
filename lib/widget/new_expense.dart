import 'dart:ffi';

import 'package:expense_tracker/DataModel/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addOnExpense});
  final void Function(Expense expense) addOnExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _ammountController = TextEditingController();
  DateTime? _pickedDate;
  Category _selectedCategory = Category.leisue;
  //2nd option to hold input text
  var _inputText = '';
  _saveInputText(String inputValue) {
    _inputText = inputValue;
  }

  _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 2, now.month, now.day);
    final dateTime = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _pickedDate = dateTime;
    });
  }

  _submitExpenseData() {
    final enteredAmount = double.tryParse(_ammountController.text);

    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (amountIsInvalid ||
        _titleController.text.trim().isEmpty ||
        _pickedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text(
              "Please make sure valid Title, Amount, Date and Category entered."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            )
          ],
        ),
      );
      return;
    }
    widget.addOnExpense(Expense(
        title: _titleController.text,
        ammount: enteredAmount,
        dateTime: _pickedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _ammountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keybordSpace = MediaQuery.of(context).viewInsets.bottom;
    double width = 0.0;
    print(width);

    _width() {
      if (width > 600) {
        return true;
      } else {
        return false;
      }
    }

    print(_width());

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          width = constraints.maxWidth;
          return SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 30, 16, keybordSpace + 16),
                child: Column(
                  children: [
                    if (_width())
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _titleController,
                              maxLength: 100,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: Text(
                                  "Title",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _ammountController,
                              maxLength: 50,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixText: '\$',
                                label: Text(
                                  "Amount",
                                  style: _textStyle(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      TextField(
                        controller: _titleController,
                        maxLength: 100,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: Text(
                            "Title",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      ),
                    if (_width())
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: DropdownButton(
                              hint: Text(
                                "Select Category",
                                style: _textStyle(),
                              ),
                              value: _selectedCategory,
                              items: Category.values
                                  .map(
                                    (category) => DropdownMenuItem(
                                      value: category,
                                      child: Text(
                                        category.name.toUpperCase(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: ((values) {
                                print(values);
                                if (values == null) {
                                  return;
                                }
                                setState(() {
                                  _selectedCategory = values;
                                });
                              }),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(_pickedDate == null
                                    ? 'Please select Date'
                                    : formatter.format(_pickedDate!)),
                                IconButton(
                                    onPressed: _showDatePicker,
                                    icon: const Icon(
                                      Icons.calendar_month_outlined,
                                    ))
                              ],
                            ),
                          )
                        ],
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _ammountController,
                              maxLength: 50,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixText: '\$',
                                label: Text(
                                  "Amount",
                                  style: _textStyle(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(_pickedDate == null
                                    ? 'Please select Date'
                                    : formatter.format(_pickedDate!)),
                                IconButton(
                                    onPressed: _showDatePicker,
                                    icon: const Icon(
                                      Icons.calendar_month_outlined,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    if (_width())
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: _textStyle(),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _submitExpenseData,
                            child: const Text("Save Expense"),
                          ),
                        ],
                      )
                    else
                      Row(
                        children: [
                          DropdownButton(
                            hint: Text(
                              "Select Category",
                              style: _textStyle(),
                            ),
                            value: _selectedCategory,
                            items: Category.values
                                .map(
                                  (category) => DropdownMenuItem(
                                    value: category,
                                    child: Text(
                                      category.name.toUpperCase(),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: ((values) {
                              print(values);
                              if (values == null) {
                                return;
                              }
                              setState(() {
                                _selectedCategory = values;
                              });
                            }),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: _textStyle(),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: _submitExpenseData,
                              child: const Text("Save Expense")),
                        ],
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      color: Theme.of(context).colorScheme.onSecondary,
    );
  }
}
