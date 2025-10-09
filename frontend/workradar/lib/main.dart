import 'package:flutter/material.dart';
import 'config/app_screens.dart'; // Import template
import 'config/app_routes.dart';  // Import routes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkRadar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppScreens.home,
      onGenerateRoute: AppRoutes.generateRoute, // Pakai route template
    );
  }
}