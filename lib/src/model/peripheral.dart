import 'package:flutter_peripheral/src/model/peripheral_color.dart';

class Peripheral {
  String title;
  String description;
  double price;
  int quantity;
  double score;
  List<String> images;
  bool isFavorite;
  List<PeripheralColor> colors;

  Peripheral({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    required this.score,
    required this.images,
    this.isFavorite = false,
    required this.colors,
  });
}
