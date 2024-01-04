import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterType { gluten, lactose, vegetarian, vegan }

class FilterNotififer extends StateNotifier<Map<FilterType, bool>> {
  FilterNotififer()
      : super({
          FilterType.gluten: false,
          FilterType.lactose: false,
          FilterType.vegetarian: false,
          FilterType.vegan: false,
        });

  setAllFilters(Map<FilterType, bool> toSet) {
    state = toSet;
  }

  setFilter(FilterType filterToChange, bool isChecked) {
    state = {...state, filterToChange: isChecked};
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotififer, Map<FilterType, bool>>(
        (ref) => FilterNotififer());
