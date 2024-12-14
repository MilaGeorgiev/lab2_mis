import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RandomJoke extends StatefulWidget {
  const RandomJoke({Key? key}) : super(key: key);

  @override
  State<RandomJoke> createState() => _RandomJokeState();
}

class _RandomJokeState extends State<RandomJoke> {
  late Future<Map<String, dynamic>> randomJoke;

  @override
  void initState() {
    super.initState();
    randomJoke = ApiService.getRandomJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: const Text("Random Joke"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: randomJoke,
        builder: (context, snapshot) {
          final joke = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  joke['setup'],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  joke['punchline'],
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
