import 'package:flutter/material.dart';

//import 'package:shopping_list/models/category.dart';

import '../dataModuleClass/category.dart';

const categories = {
  Categories.vegetables: CategoryC(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: CategoryC(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: CategoryC(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: CategoryC(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: CategoryC(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: CategoryC(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: CategoryC(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: CategoryC(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: CategoryC(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: CategoryC(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};
