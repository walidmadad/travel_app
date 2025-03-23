import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import '../widgets/trip_items.dart';

class CategoriesTripsScreen extends StatefulWidget {
  static const screenRoute = "category-trips";

  final List<Trip> availableTrips;

  const CategoriesTripsScreen({super.key, required this.availableTrips});

  @override
  State<CategoriesTripsScreen> createState() => _CategoriesTripsScreenState();
}

class _CategoriesTripsScreenState extends State<CategoriesTripsScreen> {
  late String categoryTitle = "";
  late List<Trip> displayTrips = [];

  @override
  void didChangeDependencies() {
    final routeArguments = ModalRoute.of(context)?.settings.arguments;
    if (routeArguments == null || routeArguments is! Map<String, String>) {
      return;
    }

    final categoryId = routeArguments['id'];
    categoryTitle = routeArguments['title'] ?? "N/A";

    if (categoryId != null) {
      displayTrips = widget.availableTrips.where((trip) => trip.categories.contains(categoryId)).toList();
    }
       super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
      ),
      body: ListView.builder(
        itemBuilder:
            (ctx, index) =>
                TripItems(trip: displayTrips[index]),
        itemCount: displayTrips.length,
      ),
    );
  }
}
