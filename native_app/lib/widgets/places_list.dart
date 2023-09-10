import 'package:flutter/material.dart';

import '../module/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.placeslist});
  final List<Place> placeslist;
  @override
  Widget build(BuildContext context) {
    if (placeslist.isEmpty) {
      return const Center(
        child: Text("No Places added yet"),
      );
    }

    return ListView.builder(
      itemCount: placeslist.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(
          placeslist[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
