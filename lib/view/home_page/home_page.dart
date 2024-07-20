import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sample_movies_app_flutter/utils/app_localizations.dart';
import 'package:sample_movies_app_flutter/utils/localized_build_context.dart';
import '../favorites_page/favorites_page.dart';
import '../movies_list/movies_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _buildScreens(BuildContext context) {
    return [
      const MoviesPage(),
      const FavoritesPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: (context.loc.home),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: ("Favorites"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(context),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
