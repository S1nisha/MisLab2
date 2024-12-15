import 'package:flutter/material.dart';
import 'package:lab2/models/joke_model.dart';
import 'package:lab2/services/api_services.dart';
import 'package:lab2/widgets/randomJoke/random_joke_data.dart';

class RandomJokeScreen extends StatelessWidget{
  const RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Joke',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
      ),
      backgroundColor: Colors.cyan,
      body: FutureBuilder(
          future: ApiService.getRandomJoke(),
          builder: (context, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            else if(snapshot.hasError){
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            else if(snapshot.hasData){
              var jokeData=snapshot.data;
              if(jokeData!=null){
                Joke joke= Joke.fromJson(jokeData);
                return RandomJokeData(id: joke.id, joke: joke);
              }
              return const Center(child: Text("No Joke Available"));
            }
            else{
              return const Center(child: Text("No Data Found"));
            }
          }

      ),
    );
  }
}