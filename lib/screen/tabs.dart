import 'package:flutter/material.dart';
import 'package:redo_meals/widget/side_drawer.dart';
import 'meal_screen.dart';
import 'categories_screen.dart';
import '../model/meal.dart';

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

  void _onSelectScreen(String screenID) {
    if (screenID == 'filters') {
    } else if (screenID == 'menu') {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
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
