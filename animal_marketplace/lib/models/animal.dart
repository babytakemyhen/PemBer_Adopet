import 'dart:io';

import 'package:flutter/foundation.dart';

class Animal {
  String name;
  String description;
  String price;
  File image;

  Animal({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}
