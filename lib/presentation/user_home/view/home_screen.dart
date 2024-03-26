import 'package:flutter/material.dart';
import 'package:movies_app_route/model/constants/constants.dart';
import 'package:movies_app_route/presentation/browse/view/browse_view.dart';
import 'package:movies_app_route/presentation/home/view/home_view.dart';
import 'package:movies_app_route/presentation/search/view/search_view.dart';
import 'package:movies_app_route/presentation/watchlist/view/watch_list.dart';
import 'package:movies_app_route/theme/appTheme.dart';

//import 'package:localization/localization.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      /* appBar: AppBar(
        title: Text('app_title', style: Theme.of(context).textTheme.titleLarge),
      ), */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        backgroundColor: MyTheme.blackColor,
        // Set the background color to black
        type: BottomNavigationBarType.fixed,
        // Fixed
        // backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: MyTheme.yellowColor,
        unselectedItemColor: Colors.white,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("${Constants.iconPath}Home.png")),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("${Constants.iconPath}search.png")),
            label: "SEARCH",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("${Constants.iconPath}browse.png")),
            label: "BROWSE",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("${Constants.iconPath}watch_list.png")),
            label: "WATCHLIST",
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    HomeView(),
    SearchView(),
    BrowseView(),
    WatchListView(),
  ];
}
