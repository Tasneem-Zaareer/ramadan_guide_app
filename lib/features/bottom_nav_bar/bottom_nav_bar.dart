import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../home/views/home_view.dart';

class BottomNavBar extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  BottomNavBar({super.key});

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const Center(child: Text("Calender Page")),
      const Center(child: Text("Qibla Page")),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Theme.of(context).colorScheme.tertiary,
        inactiveColorPrimary: Theme.of(context).colorScheme.tertiaryContainer,
      ),
 
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_month),
        title: (tr('calendar')),
        activeColorPrimary: Theme.of(context).colorScheme.tertiary,
        inactiveColorPrimary: Theme.of(context).colorScheme.tertiaryContainer,
      ),
 
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.explore),
        title: (tr('qibla')),
        activeColorPrimary: Theme.of(context).colorScheme.tertiary,
        inactiveColorPrimary: Theme.of(context).colorScheme.tertiaryContainer,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarItems(context),
        backgroundColor: Theme.of(context).colorScheme.surface,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }
}
