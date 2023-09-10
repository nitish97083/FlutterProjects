import 'package:flutter/material.dart';
import 'package:native_app/screen/place_detail.dart';

import '../module/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.placeslist});
  final List<Place> placeslist;
  @override
  Widget build(BuildContext context) {
    if (placeslist.isEmpty) {
      return Center(
        child: Text(
          "No Places added yet",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }

    return ListView.builder(
      itemCount: placeslist.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: FileImage(placeslist[index].image),
        ),
        title: Text(
          placeslist[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => PlaceDetails(place: placeslist[index]),
            ),
          );
        },
      ),
    );
  }
}
