import 'package:flutter/material.dart';
import '../data.dart';

class CategoriesTripsScreen extends StatelessWidget {
  static const screenRoute = "category-trips";
  @override
  Widget build(BuildContext context) {
    final routeAgrument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? categoryId = routeAgrument['id'];
    final String? categoryTitle = routeAgrument['title'];
    final filtredTrips =
        tripsData.where((trip) {
          return trip.categories.contains(categoryId) ? true : false;
        }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) => Text(filtredTrips[index].title),
        itemCount: filtredTrips.length,
      ),
    );
  }
}
