import 'package:flutter/material.dart';

import '../models/animal.dart';

class ShopPage extends StatelessWidget {
  final List<Animal> animals;

  const ShopPage({super.key, required this.animals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return ListTile(
            leading: Image.file(animal.image,
                height: 50, width: 50, fit: BoxFit.cover),
            title: Text(animal.name),
            subtitle: Text(animal.price),
          );
        },
      ),
    );
  }
}
