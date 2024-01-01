import 'package:flutter/material.dart';

import '../model/meal.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(meal.imageUrl),
          ],
        ),
      ),
    );
  }
}
