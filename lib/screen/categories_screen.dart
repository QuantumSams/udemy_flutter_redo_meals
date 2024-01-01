import "package:flutter/material.dart";
import "../widget/category_grid_item.dart";
import "../data/dummy_data.dart";
import '../model/category.dart';
import '../model/meal.dart';
import 'package:redo_meals/screen/meal_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.favoritePressed});
  final void Function(Meal mealIncoming) favoritePressed;
  //load a different screen -> no need to use statefulWidget
  void _selectCategory(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: category.title,
          meals: dummyMeals
              .where((meal) => meal.categories.contains(category.id))
              .toList(),
          favoritePressed: favoritePressed,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: availableCategories
            .map(
              (cat) => CategoryGridItem(
                category: cat,
                onTapCategory: () {
                  _selectCategory(context, cat);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
