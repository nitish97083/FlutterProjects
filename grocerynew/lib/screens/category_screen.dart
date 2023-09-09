import 'package:flutter/material.dart';
import 'package:grocerynew/screens/add_new_item.dart';
import 'package:grocerynew/widgetClass/category_list_item.dart';

import '../dataModuleClass/grocery_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void _addItem() async {
    final result = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (context) => const AddNewItem()),
    );
    if (result == null) {
      return;
    }
    setState(() {
      _addItemList.add(result);
    });
  }

  void _removeGroceryItem(GroceryItem groceryItem) {
    final expenseIndex = _addItemList.indexOf(groceryItem);
    setState(() {
      _addItemList.remove(groceryItem);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          content: const Text("Grocery Item Deleted"),
          action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                setState(() {
                  _addItemList.insert(expenseIndex, groceryItem);
                });
              }),
        ),
      );
    });
  }

  final List<GroceryItem> _addItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 20),
              iconSize: 30,
              onPressed: _addItem,
              icon: const Icon(
                Icons.add,
              ))
        ],
        title: Text('Your Grocery'),
      ),
      body: CategoryListItem(
        newItemAddedList: _addItemList,
        onDissmissed: _removeGroceryItem,
      ),
    );
  }
}
