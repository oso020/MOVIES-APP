import 'package:flutter/material.dart';
import 'package:movie_app/home/browse/browes_screen.dart';
import 'package:movie_app/home/movie_home/movie_home.dart';
import 'package:movie_app/home/search/search_screen.dart';
import 'package:movie_app/home/watch_list/watch_list_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: (index) {
            selectIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: ImageIcon(AssetImage(
                "assets/images/home_icon.png",
              )),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: ImageIcon(AssetImage(
                "assets/images/search_icon.png",
              )),
            ),
            BottomNavigationBarItem(
              label: "Browse",
              icon: ImageIcon(AssetImage(
                "assets/images/browse_icon.png",
              )),
            ),
            BottomNavigationBarItem(
              label: "WatchList",
              icon: ImageIcon(AssetImage(
                "assets/images/watchlist_icon.png",
              )),
            ),
          ],
        ),
        body: listWidgets[selectIndex],
      ),
    );
  }
  List<Widget>listWidgets=[
    MovieHome(),
    SearchScreen(),
    BrowesScreen(),
    WatchListScreen(),
  ];
}
