import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_items.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen(this.favouritesTrips);

  final List<Trip> favouritesTrips;

  @override
  Widget build(BuildContext context) {
    if(favouritesTrips.isEmpty){
      return Center(child: Text("You don't have any favourite trip"));
    }else{
      return ListView.builder(
        itemBuilder:
            (ctx, index) =>
                TripItems(trip: favouritesTrips[index]),
        itemCount: favouritesTrips.length,
      );
    }
  }
}
