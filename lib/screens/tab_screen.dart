import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  // const TabScreen({Key key, this.favoriteMeals}) : super(key: key);

  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // final List<Widget> _pages = [
  //   CategoriesScreen(),
  //   FavoriteScreen(),
  // ];
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      // textAlign: TextAlign.center,
      //   bottom: TabBar(
      //     // isScrollable: true,
      //     indicator: BoxDecoration(
      //         borderRadius: BorderRadius.circular(50), // Creates border
      //         color: Color.fromARGB(255, 31, 141, 243)),
      //     tabs: [
      //       Tab(
      //         icon: Icon(
      //           Icons.category,
      //         ),
      //         text: 'Categories',
      //       ),
      //       Tab(
      //         icon: Icon(
      //           Icons.star,
      //         ),
      //         text: 'Favorites',
      //       ),
      //     ],
      //   ),
      // ),
      // body: TabBarView(
      //   children: [
      //     CategoriesScreen(),
      //     FavoriteScreen(),
      //   ],
      // ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 25,
        // mouseCursor: SystemMouseCursors.grab,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.amberAccent),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: IconThemeData(
          color: Colors.deepOrangeAccent,
        ),
        unselectedItemColor: Colors.deepOrangeAccent,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
