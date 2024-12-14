import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<String>> getJokesApi() async {
    var response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/types"));
    return List<String>.from(jsonDecode(response.body));
  }

  static Future<List<dynamic>> getJokesType(String type) async {
    final response = await http.get(
        Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    if (response.statusCode == 200) {
      print("The jokes are found");
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load jokes of type $type');
    }
  }

  static Future<Map<String, dynamic>> getRandomJoke() async {
    final response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load random joke");
    }
  }
}
