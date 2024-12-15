import 'package:flutter/material.dart';

class DetailsBackButton extends StatelessWidget{

  const DetailsBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: ()=> Navigator.pop(context),
        backgroundColor: Colors.blue,
        tooltip: 'Go Back',
        icon: const Icon(Icons.arrow_back, color: Colors.white,),
        label: const Text("Back", style: TextStyle(color: Colors.white),));
  }
}