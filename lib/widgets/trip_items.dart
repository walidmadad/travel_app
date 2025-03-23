import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../screens/trip_deatils_screen.dart';

class TripItems extends StatelessWidget {
  final Trip trip;
  const TripItems({super.key, required this.trip});

  void selectTrip(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamed(TripDeatilsScreen.routeName, arguments: trip);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: EdgeInsets.all(7),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    trip.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [0.6, 1],
                    ),
                  ),
                  child: Text(
                    trip.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today, color: Theme.of(context).hintColor),
                      SizedBox(width: 6),
                      Text('${trip.duration} days'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.sunny, color: Theme.of(context).hintColor),
                      SizedBox(width: 6),
                      Text(trip.season.name),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).hintColor,
                      ),
                      SizedBox(width: 6),
                      Text(trip.tripType.name),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
