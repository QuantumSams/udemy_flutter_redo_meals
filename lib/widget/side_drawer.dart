import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key, required this.onSelectScreen});

  final void Function(String screenId) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.75),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.fastfood,
                  size: 45,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Let's Dine!",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('menu');
            },
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onBackground,
              size: 30,
            ),
            title: Text(
              "Menu",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filters');
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onBackground,
              size: 30,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
