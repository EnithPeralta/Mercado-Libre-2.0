import 'package:flutter/material.dart';
import 'package:mercadolibre2/src/Screens/HomeScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black 
      ),
      home: HomeScreen(),
      routes: {

      },
    );
  }
}