import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
    required this.onSelectScreen,
  });

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 20,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              onSelectScreen('Meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 20,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Filter",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              onSelectScreen('Filter');
            },
          ),
        ],
      ),
    );
  }
}
