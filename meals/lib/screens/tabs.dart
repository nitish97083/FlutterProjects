import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorite_meals.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screens/CategoryScreen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/mealscreen.dart';
import 'package:meals/widget/side_drawer.dart';

import '../providers/filter_provider.dart';

// Map<Filter, bool> kIntialFilters = {
//   Filter.gluten: false,
//   Filter.lactose: false,
//   Filter.vegetarian: false,
//   Filter.vegan: false
// };
// Filter Provider

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabsState();
}

class _TabsState extends ConsumerState<TabScreen> {
  var _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  //*************************Provider has been added to access it from Favorite Provider ******************************

  // final List<Meal> _favoriteMeal = [];

  // void _showSnakBarMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

// *************************Provider has been added to access it from Favorite Provider ******************************
  // void _toggleAddRemFavoriteMeal(Meal meal) {
  //   bool favoriteMealExist = _favoriteMeal.contains(meal);

  //   if (favoriteMealExist) {
  //     setState(() {
  //       _favoriteMeal.remove(meal);
  //     });
  //     _showSnakBarMessage("Meal is no longer a Favorite. ");
  //   } else {
  //     setState(() {
  //       _favoriteMeal.add(meal);
  //     });
  //     _showSnakBarMessage("Marked as a Favorite. ");
  //   }
  // }
//*************************Provider has been added to access it from Favorite Provider ******************************
  // Map<Filter, bool> selectedFilters = kIntialFilters;

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filter') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FilterScreen(
              // initialFilter: selectedFilters, //  *******Filter Provider Implemented

              ),
        ),
      );
      //*************************Provider has been added to access it from Favorite Provider ******************************
      // setState(() {
      //   selectedFilters = result ?? kIntialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeal = ref.watch(filterMealProvider);
    Widget activePage = CategoryScreen(
      //  onToggleFavorite: _toggleAddRemFavoriteMeal,
      availableMeals: availableMeal,
    );
    String activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      final favoriteMeal = ref.watch(favoriteMealProvider);
      activePage = MealScreen(
        meals: favoriteMeal,
        // onToggleFavorite: _toggleAddRemFavoriteMeal,
      );
      activePageTitle = " Your Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: SideDrawer(
        onSelectScreen: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
        ],
        onTap: _selectedPage,
      ),
      body: activePage,
    );
  }
}
