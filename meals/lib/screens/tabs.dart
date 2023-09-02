import 'package:flutter/material.dart';
import 'package:meals/dataset/mealdataset.dart';
import 'package:meals/screens/CategoryScreen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/mealscreen.dart';
import 'package:meals/widget/side_drawer.dart';

import '../Module/meals.dart';

Map<Filter, bool> kIntialFilters = {
  Filter.gluten: false,
  Filter.lactose: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabsState();
}

class _TabsState extends State<TabScreen> {
  var _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Meal> _favoriteMeal = [];

  void _showSnakBarMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleAddRemFavoriteMeal(Meal meal) {
    bool favoriteMealExist = _favoriteMeal.contains(meal);

    if (favoriteMealExist) {
      setState(() {
        _favoriteMeal.remove(meal);
      });
      _showSnakBarMessage("Meal is no longer a Favorite. ");
    } else {
      setState(() {
        _favoriteMeal.add(meal);
      });
      _showSnakBarMessage("Marked as a Favorite. ");
    }
  }

  Map<Filter, bool> selectedFilters = kIntialFilters;

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filter') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FilterScreen(
            initialFilter: selectedFilters,
          ),
        ),
      );
      setState(() {
        selectedFilters = result ?? kIntialFilters;
      });
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeal = dummyMeals.where((meal) {
      if (selectedFilters[Filter.gluten]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.lactose]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoryScreen(
      onToggleFavorite: _toggleAddRemFavoriteMeal,
      availableMeals: availableMeal,
    );
    String activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      activePage = MealScreen(
        meals: _favoriteMeal,
        onToggleFavorite: _toggleAddRemFavoriteMeal,
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
