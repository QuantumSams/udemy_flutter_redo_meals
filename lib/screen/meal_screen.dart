import 'package:flutter/material.dart';
import '../model/meal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (_, index) {
            return Text(
              meals[index].title,
              style: const TextStyle(color: Colors.white),
            );
          }),
    );
  }
}
