import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/joke.dart';

class Jokes extends StatefulWidget {
  const Jokes({Key? key}) : super(key: key);

  @override
  State<Jokes> createState() => _JokeState();
}

class _JokeState extends State<Jokes> {
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getJokesByType(); // Call the method here as context is now initialized
  }

  Future<void> getJokesByType() async {
    final String type = ModalRoute.of(context)!.settings.arguments as String;
    final response = await ApiService.getJokesType(type);
    setState(() {
      jokes = response
          .map<Joke>((e) => Joke.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final String type = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text('$type Jokes'),
      ),
      body: ListView.builder(
          itemCount: jokes.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              child: ListTile(
                title: Text(jokes[index].setup),
                subtitle: Text(jokes[index].punchline),
                // onTap: ,
              ),
            );
          }),
    );
  }
}
