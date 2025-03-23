import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({super.key, required this.trip});
  final Trip trip;

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(titleText, style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(trip.imageUrl, fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          buildSectionTitle(context, "Activities"),
          buildListViewContainer(
            ListView.builder(
              itemCount: trip.activities.length,
              itemBuilder:
                  (context, index) => Card(
                    elevation: 0.3,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(trip.activities[index]),
                    ),
                  ),
            ),
          ),

          SizedBox(height: 10),
          buildSectionTitle(context, "Daily Program"),

          buildListViewContainer(
            ListView.builder(
              itemCount: trip.program.length,
              itemBuilder:
                  (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).hintColor,
                          child: Text(
                            'Day ${index + 1}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.lightBlueAccent[50],
                            ),
                          ),
                        ),
                        title: Text(trip.program[index]),
                      ),
                      Divider(),
                    ],
                  ),
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
