import 'package:flutter/material.dart';
import 'meal_detail.dart';
import 'package:transparent_image/transparent_image.dart';
import '../model/meal.dart';

class MealListItem extends StatelessWidget {
  const MealListItem(
      {super.key, required this.singleMeal, required this.onTapToRecipe});
  final Meal singleMeal;

  final void Function() onTapToRecipe;

  String get complexityToString {
    return singleMeal.complexity.name[0].toUpperCase() +
        singleMeal.complexity.name.substring(1);
  }

  String get priceToString {
    return singleMeal.affordability.name[0].toUpperCase() +
        singleMeal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onTapToRecipe();
        },
        child: Stack(
          children: [
            //fading image effect
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(singleMeal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      singleMeal.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MealDetail(
                            label: "${singleMeal.duration.toString()} min",
                            icon: Icons.schedule),
                        MealDetail(label: complexityToString, icon: Icons.work),
                        MealDetail(
                            label: priceToString, icon: Icons.attach_money),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
