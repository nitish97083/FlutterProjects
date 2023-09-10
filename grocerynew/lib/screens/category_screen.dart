import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:grocerynew/dataModule/category_data.dart';
import 'package:grocerynew/screens/add_new_item.dart';
import 'package:grocerynew/widgetClass/category_list_item.dart';
import 'package:http/http.dart' as http;

import '../dataModuleClass/grocery_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with TickerProviderStateMixin {
  late Future<List<GroceryItem>> _futurelistItems;
  final List<GroceryItem> _listItems = [];
  // bool _isLoading = true; Future Builder

  @override
  void initState() {
    super.initState();
    _futurelistItems = _loadGroceryItems();

    print("Init state 2");
  }

  String? _httpResponseError;

  Future<List<GroceryItem>> _loadGroceryItems() async {
    final url = Uri.https(
        'futter-f4297-default-rtdb.firebaseio.com', 'grocery-newItem.json');
    // ignore: prefer_typing_uninitialized_variables
//***********************using future Builder  */
    //  try {
    //var url1 = Uri.parse(url);
    var response = await http.get(url);
    print("2 ${response.statusCode}");
    if (response.statusCode >= 400) {
      throw Exception("Failed to fetch Grocery Item please try again later");
      // **********************future builder implmented************************
    }
    print(response.body);
    if (response.body == 'null') {
      print("Response Null");
      // setState(() {
      //   _isLoading = false;
      // });  ****************future Builder
      return [];
    }
    final Map<String, dynamic> listData = jsonDecode(response.body);
    final List<GroceryItem> loadedlist = [];
    for (final item in listData.entries) {
      final categoryName = categories.entries
          .firstWhere(
              (element) => element.value.categoryName == item.value['category'])
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
    return loadedlist;
//********************************************future builder  */
    // setState(() {
    //   _listItems = loadedlist;
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
  }

  // catch (e) {
  //   setState(() {
  //     _httpResponseError = 'Something went wrong. Please try again!';
  //     print("3 ${e.toString()}");
  //   });
  // }
//  }
//********************************************* */

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (context) => const AddNewItem()),
    );
    if (newItem == null) {
      return;
    } else {
      setState(() {
        _listItems.add(newItem);
      });
    }
  }

  void _removeGroceryItem(GroceryItem groceryItem) async {
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
      _deleteRequest(groceryItem, expenseIndex);
    });
  }

  void _deleteRequest(GroceryItem item, int index) async {
    final url = Uri.https('futter-f4297-default-rtdb.firebaseio.com',
        'grocery-newItem/${item.id}.json');
    var response = await http.delete(url);
    print(response.statusCode);
    if (response.statusCode >= 400) {
      setState(() {
        _listItems.insert(index, item);
      });
    } else {
      setState(() {
        _listItems.remove(item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("$build  List length ${_listItems.length}");
    Widget content = const Center(
      child: Text(
        "Hey! there is no item added into your Grocery. Please try to add some item",
        style: TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );

    // if (!_isLoading && _listItems.isNotEmpty) {
    //   content = CategoryListItem(
    //       newItemAddedList: _listItems, onDissmissed: _removeGroceryItem);
    // } else if (_listItems.isNotEmpty) {
    // content = const Center(
    //   child: Text(
    //     "Hey! there is no item added into your Grocery. Please try to add some item",
    //     style: TextStyle(fontSize: 15),
    //     textAlign: TextAlign.center,
    //   ),
    // );
    // } else if (_isLoading) {
    //   content = const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
    //  print("before $_httpResponseError");
    // if (_httpResponseError != null) {
    //   content = Center(
    //     child: Text(
    //       _httpResponseError!,
    //       style: const TextStyle(fontSize: 15),
    //       textAlign: TextAlign.center,
    //     ),
    //   );
    // }
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
      body: FutureBuilder(
          future: _loadGroceryItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: const TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              );
            }
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  "Hey! there is no item added into your Grocery. Please try to add some item",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              );
            }

            return CategoryListItem(
                newItemAddedList: snapshot.data!,
                onDissmissed: _removeGroceryItem);
          }),
      //content,
    );
  }
}
