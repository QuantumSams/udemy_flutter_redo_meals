import 'package:flutter/material.dart';
import 'meal_screen.dart';
import 'categories_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabStates();
  }
}

class _TabStates extends State<Tabs> {
  int screenIndex = 0;
  void _screenIndexSet(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const CategoriesScreen();
    var activeTitle = "Categories";

    if (screenIndex == 1) {
      activeScreen = const MealScreen(meals: []);
      activeTitle = "Favorite";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeTitle)),
      body: activeScreen,
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
