import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widget/side_drawer.dart';

enum Filter { gluten, lactose, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.initialFilter});

  final Map<Filter, bool> initialFilter;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenCheckFilter = false;
  var _lactoseCheckFilter = false;
  var _vegetarian = false;
  var _veganCheckFilter = false;

  @override
  void initState() {
    _glutenCheckFilter = widget.initialFilter[Filter.gluten]!;
    _lactoseCheckFilter = widget.initialFilter[Filter.lactose]!;
    _vegetarian = widget.initialFilter[Filter.vegetarian]!;
    _veganCheckFilter = widget.initialFilter[Filter.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: SideDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'Meals') {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluten: _glutenCheckFilter,
            Filter.lactose: _lactoseCheckFilter,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _veganCheckFilter,
          });
          return false;
        },
        child: Column(
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
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only included Gluten-free meals",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 25, right: 18),
            ),
            SwitchListTile(
              value: _lactoseCheckFilter,
              onChanged: (newValue) {
                setState(() {
                  _lactoseCheckFilter = newValue;
                  print(_lactoseCheckFilter);
                });
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only included Lactose-free meals",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 25, right: 18),
            ),
            SwitchListTile(
              value: _vegetarian,
              onChanged: (newValue) {
                setState(() {
                  _vegetarian = newValue;
                  print(_vegetarian);
                });
              },
              title: Text(
                "Vageterian-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only included Vageterian-free meals",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 25, right: 18),
            ),
            SwitchListTile(
              value: _veganCheckFilter,
              onChanged: (newValue) {
                setState(() {
                  _veganCheckFilter = newValue;
                });
              },
              title: Text(
                "Vegan-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only included Vegan-free meals",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 25, right: 18),
            )
          ],
        ),
      ),
    );
  }
}
