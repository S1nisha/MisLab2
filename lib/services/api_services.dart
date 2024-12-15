import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiService{


  static const String url='https://official-joke-api.appspot.com';

  static Future<http.Response> getJokesTypes() async{
    var response=await http.get(Uri.parse('$url/types'));
    print("Joke types response: ${response.body}");
    return response;
  }

  static Future<dynamic> getJokesByType(String type) async {
    final response= await http.get(Uri.parse('$url/jokes/$type/ten'));

    if(response.statusCode ==200){
      print("Jokes of type: $type");
      var data= jsonDecode(response.body);
      print("Data: $data");
      return data;
    }
    else {
      throw Exception("Failed to load");
    }
  }

  static Future<dynamic> getRandomJoke() async{
    final response= await http.get(Uri.parse('$url/random_joke'));

    if(response.statusCode==200){
      print("Random Joke");
      var data=jsonDecode(response.body);
      print("Data $data");
      return data;
    }
    else{
      throw Exception("Failed to Load");
    }
  }
}