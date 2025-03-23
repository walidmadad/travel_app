import 'package:flutter/material.dart';
import '../widgets/trip_details.dart';
import '../models/trip.dart';

class TripDeatilsScreen extends StatelessWidget {
  const TripDeatilsScreen({super.key});
  static String routeName = "/trip-details";

  @override
  Widget build(BuildContext context) {
    final Trip trip = ModalRoute.of(context)?.settings.arguments as Trip;
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
      ),
      body: TripDetails(trip: trip),
    );
  }
}
