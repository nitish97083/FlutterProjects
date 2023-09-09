import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocerynew/dataModule/category_data.dart';
import 'package:grocerynew/screens/add_new_item.dart';
import 'package:grocerynew/widgetClass/category_list_item.dart';
import 'package:http/http.dart' as http;

import '../dataModuleClass/grocery_item.dart';
import '../dataModuleClass/shimmer/shimmer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with TickerProviderStateMixin {
  List<GroceryItem> _listItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGroceryItems();

    print("Init state 2");
  }

  final url = Uri.https(
      'futter-f4297-default-rtdb.firebaseio.com', 'grocery-newItem.json');

  void _loadGroceryItems() async {
    try {
      //var url1 = Uri.parse(url);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        final Map<String, dynamic> listData = jsonDecode(response.body);
        final List<GroceryItem> loadedlist = [];
        for (final item in listData.entries) {
          final categoryName = categories.entries
              .firstWhere((element) =>
                  element.value.categoryName == item.value['category'])
              .value;
          loadedlist.add(
            GroceryItem(
              id: item.key,
              name: item.value['name'],
              quantity: item.value['quantity'],
              category: categoryName,
            ),
          );
        }

        setState(() {
          _listItems = loadedlist;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void _addItem() async {
    await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (context) => const AddNewItem()),
    );
    _loadGroceryItems();
  }

  void _removeGroceryItem(GroceryItem groceryItem) {
    final expenseIndex = _listItems.indexOf(groceryItem);
    setState(() {
      _listItems.remove(groceryItem);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          content: const Text("Grocery Item Deleted"),
          action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                setState(() {
                  _listItems.insert(expenseIndex, groceryItem);
                });
              }),
        ),
      );
    });
  }

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
            ),
          )
        ],
        title: const Text('Your Grocery'),
      ),
      body: _listItems.isNotEmpty
          ? CategoryListItem(
              newItemAddedList: _listItems,
              onDissmissed: _removeGroceryItem,
            )
          : const Center(
              child: Text("Loading......"),
            ),
    );
  }
}
