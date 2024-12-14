import 'package:flutter/material.dart';

class JokeTypes extends StatefulWidget {
  final List<String> types;
  const JokeTypes({super.key, required this.types});

  @override
  State<JokeTypes> createState() => _JokeTypesState();
}

class _JokeTypesState extends State<JokeTypes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: widget.types.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/jokes',
                  arguments: widget.types[index]);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.types[index],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
