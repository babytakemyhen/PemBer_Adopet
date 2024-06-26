import 'package:flutter/material.dart';

import '../models/animal.dart';

class HomePage extends StatelessWidget {
  final List<Animal> animals;

  const HomePage({super.key, required this.animals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.file(animal.image, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(animal.name),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(animal.price),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
