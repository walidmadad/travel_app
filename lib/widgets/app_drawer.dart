import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  ListTile buildListTile(String title, IconData icon, dynamic onTapLInk) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.blue[700]),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTapLInk,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).hintColor,
            child: Text(
              "Home",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 20),
          buildListTile("Travels", Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Filter", Icons.filter, () {
            Navigator.of(
              context,
            ).pushReplacementNamed(FilterScreen.screenRoute);
          }),
        ],
      ),
    );
  }
}
