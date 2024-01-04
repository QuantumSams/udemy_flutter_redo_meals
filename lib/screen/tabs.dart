import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'filter.dart';
import '../widget/side_drawer.dart';
import 'meal_screen.dart';
import 'categories_screen.dart';
import '../provider/filters_provider.dart';
import '../provider/meal_provider.dart';
import '../provider/favorites_provider.dart';

const kFilterBool = {
  FilterType.gluten: false,
  FilterType.lactose: false,
  FilterType.vegetarian: false,
  FilterType.vegan: false,
};

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() {
    return _TabStates();
  }
}

class _TabStates extends ConsumerState<Tabs> {
  int screenIndex = 0;
  void _screenIndexSet(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  void _onSelectScreen(String screenID) async {
    Navigator.of(context).pop();
    if (screenID == 'filters') {
      await Navigator.of(context).push<Map<FilterType, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const Filter(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final providedMeal = ref.watch(mealProvider);
    final activeFilters = ref.watch(filtersProvider);
    final filteredMeals = providedMeal.where(
      (meal) {
        if (activeFilters[FilterType.gluten] == true && !meal.isGlutenFree) {
          return false;
        }
        if (activeFilters[FilterType.lactose] == true && !meal.isLactoseFree) {
          return false;
        }
        if (activeFilters[FilterType.vegetarian] == true &&
            !meal.isVegetarian) {
          return false;
        }
        if (activeFilters[FilterType.gluten] == true && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();

    Widget activeScreen = CategoriesScreen(
      filteredMeals: filteredMeals,
    );
    var activeTitle = "Categories";

    if (screenIndex == 1) {
      final favoritedMeals = ref.watch(favoriteMealsProvider);
      activeScreen = MealScreen(
        meals: favoritedMeals,
      );
      activeTitle = "Favorite";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeTitle)),
      body: activeScreen,
      drawer: SideDrawer(
        onSelectScreen: _onSelectScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _screenIndexSet,
          currentIndex: screenIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
          ]),
    );
  }
}
