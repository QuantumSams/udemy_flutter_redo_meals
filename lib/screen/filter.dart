import 'package:flutter/material.dart';
import 'package:redo_meals/widget/filter_switch.dart';
import 'tabs.dart';
import '../widget/side_drawer.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    var isGlutenChecked = false;
    var isLactoseChecked = false;
    var isVegetarianChecked = false;
    var isVeganChecked = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: SideDrawer(onSelectScreen: (screenID) {
        Navigator.of(context).pop;
        if (screenID == 'menu') {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const Tabs()));
        }
      }),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        children: [
          FilterSwitch(title: 'Gluten-free', currentStatus: isGlutenChecked),
          FilterSwitch(title: 'Lactos-free', currentStatus: isLactoseChecked),
          FilterSwitch(title: 'Vegetarian', currentStatus: isVegetarianChecked),
          FilterSwitch(title: 'Vegan', currentStatus: isVeganChecked)
        ],
      ),
    );
  }
}
