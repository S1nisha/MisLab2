import 'package:flutter/material.dart';
import 'package:lab2/models/joke_model.dart';

class DetailData extends StatelessWidget {
  final int id;
  final List<Joke> jokes;

  const DetailData({super.key, required this.id, required this.jokes});



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue[500],
          borderRadius:  BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: 800,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: jokes.length+1,
              itemBuilder: (context,index){
                if(index==jokes.length){
                  return SizedBox(height: 200,);
                }
                final joke=jokes[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                  color:Colors.blue[700],
                  borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
    title: Text(
      joke.setup,
    style: const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    ),
    ),
    subtitle: Text(
    joke.punchline,
    style: TextStyle(
    color: Colors.white.withOpacity(0.7),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    ),
    ),
    ),
                );

                },
        ),
      ),
    ));
  }
}