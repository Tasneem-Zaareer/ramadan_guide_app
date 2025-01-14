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
        activeColorPrimary: Theme.of(context).colorScheme.tertiary,
        inactiveColorPrimary: Theme.of(context).colorScheme.tertiaryContainer,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: (tr('search')),
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
        icon: const Icon(Icons.celebration),
        title: (tr('eid')),
        activeColorPrimary: Theme.of(context).colorScheme.tertiary,
        inactiveColorPrimary: Theme.of(context).colorScheme.tertiaryContainer,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: (tr('profile')),
        activeColorPrimary: Theme.of(context).colorScheme.tertiary,
        inactiveColorPrimary: Theme.of(context).colorScheme.tertiaryContainer,
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

// import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
// import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../home/views/home_view.dart';

// class BottomNavBarApp extends StatefulWidget {
//   final int? index;

//   const BottomNavBarApp({
//     super.key,
//     this.index,
//   });

//   @override
//   BottomNavBarAppState createState() => BottomNavBarAppState();
// }

// class BottomNavBarAppState extends State<BottomNavBarApp> {
//   late int initialIndex;
//   List<Widget> screens = [
//     const HomeView(),
//     const Center(child: Text("Search Page")),
//     const Center(child: Text("Calender Page")),
//     const Center(child: Text("Eid Page")),
//     const Center(child: Text("Profile Page")),
//   ];
//   @override
//   void initState() {
//     super.initState();
//     initialIndex = widget.index ?? 0;
//   }

//   final List<TabItem> items = [
//     TabItem(
//       icon: Icons.home,
//       title: tr('search'),
//     ),
//     TabItem(
//       icon: Icons.favorite_border,
//       title: tr('claendar'),
//     ),
//     TabItem(
//       icon: Icons.search_sharp,
//       title: tr('eid'),
//     ),
//     TabItem(
//       icon: Icons.account_box,
//       title: tr('profile'),
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // drawer: const AppDrawer(),
//       // appBar: AppBar(
//       //   centerTitle: false,
//       //   backgroundColor: Theme.of(context).colorScheme.onPrimary,
//       //   leading: Builder(
//       //     builder: (BuildContext context) {
//       //       return InkWell(
//       //         onTap: () {
//       //           Scaffold.of(context).openDrawer();
//       //         },
//       //         child: Icon(
//       //           Icons.menu,
//       //           size: 28.h,
//       //         ),
//       //       );
//       //     },
//       //   ),

//       // ),
//       body: screens[initialIndex],
//       bottomNavigationBar: BottomBarInspiredInside(
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         items: items,
//         color: Colors.white,
//         colorSelected: Colors.white,
//         indexSelected: initialIndex,
//         onTap: (int selectedIndex) => setState(() {
//           initialIndex = selectedIndex;
//         }),
//         chipStyle: ChipStyle(
//           convexBridge: true,
//           background: Theme.of(context).colorScheme.onSecondary,
//         ),
//         itemStyle: ItemStyle.circle,
//         animated: false,
//       ),
//     );
//   }
// }
