import 'package:flutter/material.dart';
import 'package:plantdirectory/src/screens/homeScreen.dart';
import 'package:plantdirectory/src/screens/plantDetails.dart';
import 'package:plantdirectory/src/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home:SplashScreen()
      // home: HomeScreen(),
      home: PlantDetails(),
    );
  }
}

