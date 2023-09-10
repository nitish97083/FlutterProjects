import 'package:flutter/material.dart';
import 'package:native_app/widgets/places_list.dart';

class PlacesSCreen extends StatelessWidget {
  const PlacesSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: PlacesList(placeslist: []),
    );
  }
}
