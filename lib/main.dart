import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/jokes.dart';
import './screens/random_joke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Jokes App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/jokes': (context) => const Jokes(),
        '/random_joke': (context) => const RandomJoke()
      },
    );
    // Application theme data, you can set the colors for the application as
    // you want
  }
}
