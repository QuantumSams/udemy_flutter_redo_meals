import 'package:flutter/material.dart';

class FilterSwitch extends StatefulWidget {
  const FilterSwitch(
      {super.key,
      required this.title,
      required this.currentStatus,
      required this.switchIndividual});

  final String title;
  final bool currentStatus;
  final void Function(bool isChecked) switchIndividual;

  @override
  State<FilterSwitch> createState() {
    return _FilterSwitchState();
  }
}

class _FilterSwitchState extends State<FilterSwitch> {
  var curStatus = false;

  @override
  void initState() {
    curStatus = widget.currentStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: curStatus,
      onChanged: (isChecked) {
        setState(() {
          curStatus = isChecked;
        });
        widget.switchIndividual(isChecked);
      },
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        'Toggle to filter out ${widget.title} meals',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
