import 'package:flutter/material.dart';
import 'package:redo_meals/widget/filter_switch.dart';

enum FilterType { gluten, lactose, vegetarian, vegan }

class Filter extends StatefulWidget {
  const Filter({super.key, required this.savedFilterToggle});
  final Map<FilterType, bool> savedFilterToggle;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var isGlutenChecked = false;
  var isLactoseChecked = false;
  var isVegetarianChecked = false;
  var isVeganChecked = false;

  @override
  void initState() {
    isGlutenChecked = widget.savedFilterToggle[FilterType.gluten]!;
    isLactoseChecked = widget.savedFilterToggle[FilterType.lactose]!;
    isVegetarianChecked = widget.savedFilterToggle[FilterType.vegetarian]!;
    isVeganChecked = widget.savedFilterToggle[FilterType.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void switchGluten(bool isChecked) {
      setState(() {
        isGlutenChecked = isChecked;
      });
    }

    void switchLactose(bool isChecked) {
      setState(() {
        isLactoseChecked = isChecked;
      });
    }

    void switchVegetarian(bool isChecked) {
      setState(() {
        isVegetarianChecked = isChecked;
      });
    }

    void switchVegan(bool isChecked) {
      setState(() {
        isVeganChecked = isChecked;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            FilterType.gluten: isGlutenChecked,
            FilterType.lactose: isLactoseChecked,
            FilterType.vegetarian: isVegetarianChecked,
            FilterType.vegan: isVeganChecked
          });
          return false;
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          children: [
            FilterSwitch(
                title: 'Gluten-free',
                currentStatus: isGlutenChecked,
                switchIndividual: switchGluten),
            FilterSwitch(
                title: 'Lactos-free',
                currentStatus: isLactoseChecked,
                switchIndividual: switchLactose),
            FilterSwitch(
                title: 'Vegetarian',
                currentStatus: isVegetarianChecked,
                switchIndividual: switchVegetarian),
            FilterSwitch(
                title: 'Vegan',
                currentStatus: isVeganChecked,
                switchIndividual: switchVegan)
          ],
        ),
      ),
    );
  }
}
