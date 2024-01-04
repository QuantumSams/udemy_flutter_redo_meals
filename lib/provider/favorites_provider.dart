import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/meal.dart';

class favoriteMealsNotifier extends StateNotifier<List<Meal>> {
  favoriteMealsNotifier() : super([]);

  bool toggleFavoriteMeals(Meal meal) {
    if (state.contains(meal) == true) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<favoriteMealsNotifier, List<Meal>>(
        (ref) => favoriteMealsNotifier());
