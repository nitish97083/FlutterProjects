import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.lablel});

  final IconData icon;
  final String lablel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        const SizedBox(
          width: 1,
        ),
        Text(
          lablel,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}
