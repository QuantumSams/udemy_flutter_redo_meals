import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widget/meal_list_item.dart';
import 'recipe_screen.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void _selectRecipe(BuildContext context, Meal meal) {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => RecipeScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (_, index) => MealListItem(
          singleMeal: meals[index],
          onTapToRecipe: () {
            _selectRecipe(context, meals[index]);
          }),
    );

    if (meals.isEmpty) {
      content = Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "No meal here",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 10),
            Text(
              "Please select a different category",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
