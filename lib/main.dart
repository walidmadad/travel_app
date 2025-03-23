import 'package:flutter/material.dart';
import 'package:travel_app/data.dart';
import './screens/filter_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_trips_screen.dart';
import './screens/trip_deatils_screen.dart';
import './models/trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "summer": false,
    "winter": false,
    "family": false,
  };

  List<Trip> _availableTrips = tripsData;
  List<Trip>_favouriteTrips = [];

  void _changeFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrips =
          tripsData.where((trip) {
            if (_filters['summer'] == true && trip.isInSummer != true) {
              return false;
            }
            if (_filters['winter'] == true && trip.isInWinter != true) {
              return false;
            }
            if (_filters['family'] == true && trip.isForFamilies != true) {
              return false;
            }
            return true;
          }).toList();
    });

  }

  void _manageFavourite(Trip tripT){
    final existingIndex = _favouriteTrips.indexWhere((trip) => trip.id == tripT.id);
    if(existingIndex >= 0){
      setState(() {
        _favouriteTrips.removeAt(existingIndex);
      });
    }else{
        setState((){
          _favouriteTrips.add(tripsData.firstWhere((trip) => trip.id == tripT.id));
        }); 
      }
  }

  bool _isFavourite(String id){
    return _favouriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel App",
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        hintColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
          headlineMedium: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontFamily: "Arial",
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Arial",
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      supportedLocales: [const Locale('en', 'eng')],
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouriteTrips),
        CategoriesTripsScreen.screenRoute:
            (ctx) => CategoriesTripsScreen(availableTrips: _availableTrips),
        TripDeatilsScreen.routeName: (ctx) => TripDeatilsScreen(_manageFavourite, _isFavourite),
        FilterScreen.screenRoute: (ctx) => FilterScreen(_filters,_changeFilter),
      },
    );
  }
}
