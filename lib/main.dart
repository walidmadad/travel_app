import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/categories_trips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        '/': (ctx) => CategoriesScreen(),
        CategoriesTripsScreen.screenRoute: (ctx) => CategoriesTripsScreen(),
      },
    );
  }
}
