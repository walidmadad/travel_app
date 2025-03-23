import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text("Travel App", style: TextStyle(color: Colors.white)),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard, color: Colors.white),
                child: Text(
                  "Categories",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: Icon(Icons.star, color: Colors.white),
                child: Text("Favourite", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [CategoriesScreen(), FavouritesScreen()]),
      ),
    );
  }
}
