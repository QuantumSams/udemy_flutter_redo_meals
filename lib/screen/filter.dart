import 'package:flutter/material.dart';
import 'package:redo_meals/widget/filter_switch.dart';
import '../provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Filter extends ConsumerStatefulWidget {
  const Filter({super.key});

  @override
  ConsumerState<Filter> createState() => _FilterState();
}

class _FilterState extends ConsumerState<Filter> {
  var isGlutenChecked = false;
  var isLactoseChecked = false;
  var isVegetarianChecked = false;
  var isVeganChecked = false;

  @override
  void initState() {
    final savedFilterToggle = ref.read(filtersProvider);
    isGlutenChecked = savedFilterToggle[FilterType.gluten]!;
    isLactoseChecked = savedFilterToggle[FilterType.lactose]!;
    isVegetarianChecked = savedFilterToggle[FilterType.vegetarian]!;
    isVeganChecked = savedFilterToggle[FilterType.vegan]!;
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
          ref.read(filtersProvider.notifier).setAllFilters({
            FilterType.gluten: isGlutenChecked,
            FilterType.lactose: isLactoseChecked,
            FilterType.vegetarian: isVegetarianChecked,
            FilterType.vegan: isVeganChecked
          });
          return true;
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
