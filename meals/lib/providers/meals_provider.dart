import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/dataset/mealdataset.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
