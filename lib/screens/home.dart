import 'package:flutter/material.dart';
import 'package:lab2/widgets/joke_types.dart';
import '../services/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    getJokesFromApi();
  }

  void getJokesFromApi() async {
    jokeTypes = await ApiService.getJokesApi();
    setState(() {
      jokeTypes = jokeTypes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: const Text("Jokes"),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb),
            onPressed: () {
              Navigator.pushNamed(context, '/random_joke');
            },
          ),
        ],
      ),
      body: JokeTypes(types: jokeTypes),
    );
  }
}
