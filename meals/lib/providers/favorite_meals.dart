import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Module/meals.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  bool toggleMealFavoriteState(Meal meal) {
    final isMealFavorite = state.contains(meal);

    if (isMealFavorite) {
      state = state
          .where((element) => element.id != meal.id)
          .toList(); //Removing favorite Meal by clicking on Favorite Icon
      return false;
    } else {
      state = [...state, meal];
      return true; // adding favorite Meal by clicking on Favorite Icon
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
  return FavoriteMealNotifier();
});
