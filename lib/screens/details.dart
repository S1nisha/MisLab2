import 'package:flutter/material.dart';
import 'package:lab2/models/joke_model.dart';
import 'package:lab2/services/api_services.dart';
import 'package:lab2/widgets/details/details_back_button.dart';
import 'package:lab2/widgets/details/details_data.dart';
import 'package:lab2/widgets/details/details_title.dart';

class Details extends StatefulWidget{
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details>{
  List<Joke> jokes= [];
  String type= '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments=ModalRoute.of(context)?.settings.arguments as Map;
    type= arguments['type'];
    print("Type: $type");
    if(type.isNotEmpty){
      getJokesByType(type);
    }
  }

  void getJokesByType(String type) async {
    ApiService.getJokesByType(type).then((response){
      print("$response");
      if(response.isNotEmpty){
        setState(() {
          jokes=(response as List).map((jokeData)=> Joke.fromJson(jokeData)).toList();
        });
      }
    }).catchError((error){
      print("$error");
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            DetailTitle(id: 1, type: type), // Passing '1' as a placeholder for id
            DetailData(id: 1, jokes: jokes),  // Passing the joke object here
          ],
        ),
      ),
      floatingActionButton: const DetailsBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }}

