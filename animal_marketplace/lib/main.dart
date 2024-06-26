import 'package:animal_marketplace/screens/home_screen.dart';
import 'package:animal_marketplace/screens/sell_screen.dart';
import 'package:animal_marketplace/screens/shop_screen.dart';
import 'package:flutter/material.dart';

import 'models/animal.dart';

void main() {
  runApp(const AnimalApp());
}

class AnimalApp extends StatelessWidget {
  const AnimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const AnimalHomePage(),
    );
  }
}

class AnimalHomePage extends StatefulWidget {
  const AnimalHomePage({super.key});

  @override
  AnimalHomePageState createState() => AnimalHomePageState();
}

class AnimalHomePageState extends State<AnimalHomePage> {
  int _currentIndex = 0;
  final List<Animal> _animals = [];

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.add(HomePage(animals: _animals));
    _pages.add(ShopPage(animals: _animals));
    _pages.add(SellPage(onAddAnimal: _addAnimal));
  }

  void _addAnimal(Animal animal) {
    setState(() {
      _animals.add(animal);
      _currentIndex = 0;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Sell'),
        ],
      ),
    );
  }
}
