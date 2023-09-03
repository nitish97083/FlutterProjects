// ignore: file_names
import 'package:flutter/material.dart';
import 'package:meals/Module/CategoryModule.dart';
import 'package:meals/dataset/CategoryData.dart';
import 'package:meals/screens/mealscreen.dart';
import 'package:meals/widget/category_grid_items.dart';

import '../Module/meals.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key,
      //  required this.onToggleFavorite,  ConsumerProveder implemented
      required this.availableMeals});

  // final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  void _selectedCategory(BuildContext context, CategoryModule category) {
    final filterList = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealScreen(
          title: category.title,
          meals: filterList,
          //  onToggleFavorite: onToggleFavorite, ConsumerProveder implemented
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 3 / 2,
        //mainAxisExtent: 100,// length of box
      ),
      children: [
        ...availableCategories
            .map(
              (e) => CategoryGridItem(
                categoryItem: e,
                selectedCategory: () {
                  _selectedCategory(context,
                      e); //calling function before passing to constructory
                },
              ),
            )
            .toList(),
        // for (final category in availableCategories)
        //   CategoryGridItem(categoryItem: category),
      ],
    );
  }
}
