import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redo_meals/data/dummy_data.dart';

final mealProvider = Provider((ref) => dummyMeals);
