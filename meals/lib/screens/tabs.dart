import 'package:flutter/material.dart';
import 'package:meals/screens/CategoryScreen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/mealscreen.dart';
import 'package:meals/widget/side_drawer.dart';

import '../Module/meals.dart';

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

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'Filter') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      onToggleFavorite: _toggleAddRemFavoriteMeal,
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
