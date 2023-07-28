import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ControllerScreen extends StatelessWidget {
  const ControllerScreen({super.key, required this.shell});
  final StatefulNavigationShell shell;

  void _goBranch(int index) {
    shell.goBranch(index, initialLocation: index == shell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
          selectedIndex: shell.currentIndex,
          onDestinationSelected: _goBranch,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "home",
              selectedIcon: Icon(Icons.macro_off),
            ),
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "home",
              selectedIcon: Icon(Icons.macro_off),
            ),
          ]),
    );
  }
}
