import 'package:flutter/material.dart';
import '../widgets/trip_details.dart';
import '../models/trip.dart';

class TripDeatilsScreen extends StatelessWidget {
  static String routeName = "/trip-details";
  final Function manageFavourite;
  final Function isFavourite;
  const TripDeatilsScreen(this.manageFavourite, this.isFavourite);


  @override
  Widget build(BuildContext context) {
    final Trip trip = ModalRoute.of(context)?.settings.arguments as Trip;
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
      ),
      body: TripDetails(trip: trip),
      floatingActionButton: FloatingActionButton(
        onPressed: () => manageFavourite(trip),
        child: Icon(
          isFavourite(trip.id) ? Icons.star : Icons.star_border
          ),
      ),
    );
  }
}
