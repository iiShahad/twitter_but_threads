import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_but_threads/theme/pallete.dart';

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
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: Colors.transparent,
          elevation: 0,
          indicatorColor: Colors.transparent,
          selectedIndex: shell.currentIndex,
          onDestinationSelected: _goBranch,
          destinations: [
            NavigationDestination(
              icon: ImageIcon(
                const AssetImage("assets/icons/home.png"),
                color: Pallete.greyColor.withOpacity(0.5),
              ),
              label: "home",
              selectedIcon: const ImageIcon(
                AssetImage("assets/icons/home.png"),
                color: Colors.white,
              ),
            ),
            NavigationDestination(
              icon: ImageIcon(
                const AssetImage("assets/icons/searchnormal1.png"),
                color: Pallete.greyColor.withOpacity(0.5),
              ),
              label: "home",
              selectedIcon: const ImageIcon(
                AssetImage("assets/icons/searchnormal1.png"),
                color: Colors.white,
              ),
            ),
            NavigationDestination(
              icon: ImageIcon(
                const AssetImage("assets/icons/heart.png"),
                color: Pallete.greyColor.withOpacity(0.5),
              ),
              label: "home",
              selectedIcon: const ImageIcon(
                AssetImage("assets/icons/heart.png"),
                color: Colors.white,
              ),
            ),
            NavigationDestination(
              icon: ImageIcon(
                const AssetImage("assets/icons/message.png"),
                color: Pallete.greyColor.withOpacity(0.5),
              ),
              label: "home",
              selectedIcon: const ImageIcon(
                AssetImage("assets/icons/message.png"),
                color: Colors.white,
              ),
            ),
            NavigationDestination(
              icon: ImageIcon(
                const AssetImage("assets/icons/profile.png"),
                color: Pallete.greyColor.withOpacity(0.5),
              ),
              label: "home",
              selectedIcon: const ImageIcon(
                AssetImage("assets/icons/profile.png"),
                color: Colors.white,
              ),
            ),
          ]),
    );
  }
}
