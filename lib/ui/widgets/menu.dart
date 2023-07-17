import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final int menuOptionSelected;
  final Function(int) onOptionMenuSelected;

  const Menu(
      {super.key,
      required this.menuOptionSelected,
      required this.onOptionMenuSelected});

  @override
  Widget build(BuildContext context) {
    double buttonSize = 30;
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera_alt_outlined,
            size: buttonSize,
          ),
          label: 'Clasificador',
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list_alt_outlined,
            size: buttonSize,
          ),
          label: 'Red neuronal',
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
      ],
      currentIndex: menuOptionSelected,
      selectedItemColor: Theme.of(context).colorScheme.tertiary,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      selectedLabelStyle: Theme.of(context).textTheme.titleMedium,
      unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
      onTap: onOptionMenuSelected,
    );
  }
}
