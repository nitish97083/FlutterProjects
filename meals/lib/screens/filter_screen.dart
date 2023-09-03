import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
    //required this.initialFilter,  *********** Filter Provider Implemented
  });

  //final Map<Filter, bool> initialFilter; *******Filter Provider Implemented
//   @override
//   ConsumerState<FilterScreen> createState() => _FilterScreenState();
// }

// class _FilterScreenState extends ConsumerState<FilterScreen> {
//   var _glutenCheckFilter = false;
//   var _lactoseCheckFilter = false;
//   var _vegetarian = false;
//   var _veganCheckFilter = false;

//   @override
//   void initState() {
//     super.initState();
//     final activeFilter = ref.read(filtersProvider);
//     _glutenCheckFilter = activeFilter[Filter.gluten]!;
//     _lactoseCheckFilter = activeFilter[Filter.lactose]!;
//     _vegetarian = activeFilter[Filter.vegetarian]!;
//     _veganCheckFilter = activeFilter[Filter.vegan]!;
//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filtersProvider);
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
      body:
          // WillPopScope(
          //   onWillPop: () async {
          //     ref.read(filtersProvider.notifier).setFilters({
          //       Filter.gluten: _glutenCheckFilter,
          //       Filter.lactose: _lactoseCheckFilter,
          //       Filter.vegetarian: _vegetarian,
          //       Filter.vegan: _veganCheckFilter,
          //     });
          // Navigator.of(context).pop({
          //   Filter.gluten: _glutenCheckFilter,
          //   Filter.lactose: _lactoseCheckFilter,
          //   Filter.vegetarian: _vegetarian,
          //   Filter.vegan: _veganCheckFilter,
          // });  // *************************Filter Provider Added
          // return true;
          //  },
          Column(
        children: [
          SwitchListTile(
            value: activeFilter[Filter.gluten]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.gluten, newValue);
              // setState(() {
              //   _glutenCheckFilter = newValue;
              // });
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
          ),
          SwitchListTile(
            value: activeFilter[Filter.lactose]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactose, newValue);
              // setState(() {
              //   _lactoseCheckFilter = newValue;
              //   print(_lactoseCheckFilter);
              // });
            },
            title: Text(
              "Lactose-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only included Lactose-free meals",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 25, right: 18),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegetarian]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, newValue);
              // setState(() {
              //   _vegetarian = newValue;
              //   print(_vegetarian);
              // });
            },
            title: Text(
              "Vageterian-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only included Vageterian-free meals",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 25, right: 18),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegan]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, newValue);
            },
            title: Text(
              "Vegan-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only included Vegan-free meals",
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
