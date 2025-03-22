import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import '../data.dart';
import '../widgets/trip_items.dart';

class CategoriesTripsScreen extends StatelessWidget {
  static const screenRoute = "category-trips";
  @override
  Widget build(BuildContext context) {
    final routeAgrument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? categoryId = routeAgrument['id'];
    final String? categoryTitle = routeAgrument['title'];
    final List<Trip> filteredTrips =
        tripsData.where((trip) {
          return trip.categories.contains(categoryId) ? true : false;
        }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => TripItems(trip: filteredTrips[index]),
        itemCount: filteredTrips.length,
      ),
    );
  }
}
