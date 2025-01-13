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
      const Center(child: Text("Search Page")),
      const Center(child: Text("Calender Page")),
      const Center(child: Text("Eid Page")),
      const Center(child: Text("Profile Page")),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Theme.of(context).colorScheme.onBackground,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: (tr('search')),
        activeColorPrimary: Theme.of(context).colorScheme.onBackground,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_month),
        title: (tr('calendar')),
        activeColorPrimary: Theme.of(context).colorScheme.onBackground,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.celebration),
        title: (tr('eid')),
        activeColorPrimary: Theme.of(context).colorScheme.onBackground,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: (tr('profile')),
        activeColorPrimary: Theme.of(context).colorScheme.onBackground,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(context),
      // confineInSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      handleAndroidBackButtonPress: true, // Default is true
      resizeToAvoidBottomInset: true, // Default is true
      stateManagement: true, // Default is true
      // hideNavigationBarWhenKeyboardShows: true, // Default is true
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      // popAllScreensOnTapOfSelectedTab: true,
      // popActionScreens: PopActionScreensType.all,
      // itemAnimationProperties: ItemAnimationProperties(
      //   duration: Duration(milliseconds: 200),
      //   curve: Curves.ease,
      // ),
      // screenTransitionAnimation: ScreenTransitionAnimation(
      //   animateTabTransition: true,
      //   curve: Curves.ease,
      //   duration: Duration(milliseconds: 200),
      // ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property
    );
  }
}
