import 'package:flutter/material.dart';
import '../model/meal.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({super.key, required this.singleMeal});
  final Meal singleMeal;

  @override
  Widget build(BuildContext context) {
    return Text(
      singleMeal.title,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
    );
  }
}
