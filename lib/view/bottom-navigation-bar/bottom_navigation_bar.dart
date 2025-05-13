import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:uber_eats_restaurant/view/add_food_item/add_food_item.dart';
import 'package:uber_eats_restaurant/view/status_screen/status_screen.dart';

import '../../constant/colors.dart';
import '../account/account.dart';
import '../home/home.dart';

class BottomNavigationBarUberEats extends StatefulWidget {
  const BottomNavigationBarUberEats({super.key});

  @override
  State<BottomNavigationBarUberEats> createState() =>
      _BottomNavigationBarUberEatsState();
}

class _BottomNavigationBarUberEatsState
    extends State<BottomNavigationBarUberEats> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: FaIcon(FontAwesomeIcons.house),
            title: "Home",
            activeForegroundColor: black,
            inactiveForegroundColor: grey,
          ),
        ),
        PersistentTabConfig(
          screen: const AddFoodItemScreen(),
          item: ItemConfig(
            icon: FaIcon(FontAwesomeIcons.list),
            title: "Menu",
            activeForegroundColor: black,
            inactiveForegroundColor: grey,
          ),
        ),
        PersistentTabConfig(
          screen: const StatusScreen(),
          item: ItemConfig(
            icon: FaIcon(FontAwesomeIcons.house),
            title: "Stats",
            activeForegroundColor: black,
            inactiveForegroundColor: grey,
          ),
        ),
        PersistentTabConfig(
          screen: const AccountScreen(),
          item: ItemConfig(
            icon: FaIcon(FontAwesomeIcons.person),
            title: "Account",
            activeForegroundColor: black,
            inactiveForegroundColor: grey,
          ),
        ),
      ],
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}
