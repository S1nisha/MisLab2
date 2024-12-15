import 'package:flutter/material.dart';
import 'package:lab2/models/joke_model.dart';

class RandomJokeData extends StatelessWidget{
  final int id;
  final Joke joke;

  const RandomJokeData({super.key, required this.id, required this.joke});

  @override
  Widget build(BuildContext context) {
    final setup = joke.setup;
    final punchline = joke.punchline;

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue[500],
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text(
                setup,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),
              ),
              tileColor:Colors.redAccent[50],
            ),
            ListTile(
              title: Text(
                punchline,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              tileColor: Colors.redAccent[50],
            )
          ],
        ),
      ),
    );
  }
}