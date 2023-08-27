import 'package:flutter/material.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/widget/meal_item.dart';

import '../Module/meals.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void _selectedMeal(BuildContext context, Meal meal) {
    // final mealFilterList =
    //     dummyMeals.where((meal) => meal.title.contains(meal.title)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => MealDetailsScreen(
                title: meal.title,
                meal: meal,
                onToggleFavorite: onToggleFavorite,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mealContent = ListView.builder(
      itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          onSelectedMeal: (meal) {
            _selectedMeal(context, meal);
          }),
    );
    if (meals.isEmpty) {
      mealContent = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              " Ohh! There is no Meal Available",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Try selecting different Category!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }

    if (meals.isNotEmpty) {
      mealContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          onSelectedMeal: (meal) {
            _selectedMeal(context, meals[index]);
          },
        ),
      );
    }
    if (title == null) {
      return mealContent;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: mealContent);
  }
}
