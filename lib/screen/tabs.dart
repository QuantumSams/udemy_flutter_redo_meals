import 'package:flutter/material.dart';
import 'package:redo_meals/data/dummy_data.dart';
import 'filter.dart';
import '../widget/side_drawer.dart';
import 'meal_screen.dart';
import 'categories_screen.dart';
import '../model/meal.dart';

const kFilterBool = {
  FilterType.gluten: false,
  FilterType.lactose: false,
  FilterType.vegetarian: false,
  FilterType.vegan: false,
};

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabStates();
  }
}

class _TabStates extends State<Tabs> {
  int screenIndex = 0;
  final List<Meal> _favoritedMeal = [];
  Map<FilterType, bool> filterBool = kFilterBool;
  void _screenIndexSet(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  void _showFavoriteConfirmation(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _alterFavoriteMealList(Meal mealIncoming) {
    if (_favoritedMeal.contains(mealIncoming)) {
      setState(() {
        _favoritedMeal.remove(mealIncoming);
        _showFavoriteConfirmation("Removed from favorite list");
      });
    } else {
      setState(() {
        _favoritedMeal.add(mealIncoming);
        _showFavoriteConfirmation("Added to favorite list");
      });
    }
  }

  void _onSelectScreen(String screenID) async {
    Navigator.of(context).pop();
    if (screenID == 'filters') {
      final filterStatusMap =
          await Navigator.of(context).push<Map<FilterType, bool>>(
        MaterialPageRoute(
          builder: (ctx) => Filter(
            savedFilterToggle: filterBool,
          ),
        ),
      );
      setState(() {
        filterBool = filterStatusMap ?? kFilterBool;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals.where(
      (meal) {
        if (filterBool[FilterType.gluten] == true && !meal.isGlutenFree) {
          return false;
        }
        if (filterBool[FilterType.lactose] == true && !meal.isLactoseFree) {
          return false;
        }
        if (filterBool[FilterType.vegetarian] == true && !meal.isVegetarian) {
          return false;
        }
        if (filterBool[FilterType.gluten] == true && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();

    Widget activeScreen = CategoriesScreen(
      filteredMeals: filteredMeals,
      favoritePressed: _alterFavoriteMealList,
    );
    var activeTitle = "Categories";

    if (screenIndex == 1) {
      activeScreen = MealScreen(
        meals: _favoritedMeal,
        favoritePressed: _alterFavoriteMealList,
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
