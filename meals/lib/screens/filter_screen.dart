import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widget/side_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenCheckFilter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: SideDrawer(onSelectScreen: (identifier) {
        Navigator.of(context).pop();
        if (identifier == 'Meals') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const TabScreen(),
            ),
          );
        }
      }),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenCheckFilter,
            onChanged: (newValue) {
              setState(() {
                _glutenCheckFilter = newValue;
              });
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only included Gluten-free meals",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 25, right: 18),
          )
        ],
      ),
    );
  }
}
