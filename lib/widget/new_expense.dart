import 'package:expense_tracker/DataModel/expense.dart';
import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 100,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _ammountController,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: '\$', label: Text("Amount")),
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
          Row(
            children: [
              DropdownButton(
                hint: const Text("Select Category"),
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
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text("Save Expense")),
            ],
          )
        ],
      ),
    );
  }
}
