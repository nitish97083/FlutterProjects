import 'package:flutter/material.dart';
import 'package:meals/Module/CategoryModule.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.categoryItem, required this.selectedCategory});
  final CategoryModule categoryItem;
  final void Function() selectedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedCategory,
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius:
          BorderRadius.circular(10), //splash the color when button pressed
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              categoryItem.color.withOpacity(0.55),
              categoryItem.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Text(
          categoryItem.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
