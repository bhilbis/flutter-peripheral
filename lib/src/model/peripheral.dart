// import 'package:flutter_peripheral/src/model/peripheral_color.dart';

class Peripheral {
  String id;
  String title;
  String description;
  double price;
  int quantity;
  double score;
  List<String> images;
  bool isFavorite;

  Peripheral({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    required this.score,
    required this.images,
    this.isFavorite = false,
  });

  Peripheral copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? images,
    double? price,
    int? quantity,
    bool? isFavorite,
    double? score,
  }) {
    return Peripheral(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      images: images ?? this.images,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      isFavorite: isFavorite ?? this.isFavorite,
      score: score ?? this.score,
    );
  }
}
