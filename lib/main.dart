import 'package:flutter/material.dart';
import 'package:lab2/screens/details.dart';
import 'package:lab2/screens/home.dart';
import 'package:lab2/screens/random_joke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JokeApp',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      visualDensity:VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes:{
      "/":(context)=> const Home(),
      "/details":(context)=> const Details(),
      "/random-joke":(context)=> const RandomJokeScreen()
      }
    );
  }
}
