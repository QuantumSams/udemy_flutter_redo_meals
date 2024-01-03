import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() {
    return _FilterState();
  }
}

class _FilterState extends State<Filter> {
  var _isGlutenChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _isGlutenChecked,
            onChanged: (isChecked) {
              setState(() {
                _isGlutenChecked = isChecked;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Subtitle sample',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          )
        ],
      ),
    );
  }
}
