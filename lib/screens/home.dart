import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab2/models/joke_type.dart';
import 'package:lab2/widgets/jokeType/joke_type_grid.dart';
import 'package:lab2/services/api_services.dart';
import 'package:lab2/screens/random_joke.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState()=> _HomeState();
}

class _HomeState extends State<Home>{
  List<JokeType> jokeTypes= [];

  @override
  void initState(){
    super.initState();
    getJokeFromApi();
  }

  void getJokeFromApi() async {
    ApiService.getJokesTypes().then((response){
      var data= List.from(json.decode(response.body));
      setState(() {
        jokeTypes=data.map<JokeType>((element){
          return JokeType(type: element);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
          title: const Text("Joke App",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [IconButton(
              onPressed: (){Navigator.push(
                  context,MaterialPageRoute(
                  builder: (context)=> const RandomJokeScreen()));},
                  icon: const Icon(Icons.lightbulb_outline_rounded,
                  color: Colors.white,
                  size: 24,)
          ),
          ],
      ),
      body: JokeTypeGrid(jokeTypes: jokeTypes),
      backgroundColor: Colors.lightBlue,
    );
  }

}