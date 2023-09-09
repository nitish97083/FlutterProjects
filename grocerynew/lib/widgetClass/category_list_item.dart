import 'package:flutter/material.dart';

import 'package:grocerynew/dataModuleClass/grocery_item.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem(
      {super.key, required this.newItemAddedList, required this.onDissmissed});
  final List<GroceryItem> newItemAddedList;
  final void Function(GroceryItem groceryItem) onDissmissed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newItemAddedList.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(newItemAddedList[index]),
        child: ListTile(
          leading: Icon(
            Icons.square,
            color: newItemAddedList[index].category.categoryColor,
          ),
          title: Text(
            newItemAddedList[index].name,
          ),
          trailing: Text("${newItemAddedList[index].quantity}"),
        ),
        onDismissed: (direction) {
          onDissmissed(newItemAddedList[index]);
        },
      ),
    );
  }
}
