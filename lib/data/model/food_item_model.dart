import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FoodItemModel extends Equatable {
  const FoodItemModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
  });

  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final double? price;

  factory FoodItemModel.fromSnapshot(
    DocumentSnapshot snapshot,
  ) {
    return FoodItemModel(
      id: snapshot.id,
      name: snapshot.get('name'),
      description: snapshot.get('description'),
      imageUrl: snapshot.get('image_url'),
      price: snapshot.get('price'),
    );
  }

  factory FoodItemModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return FoodItemModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      price: json['price'],
    );
  }

  @override
  List<Object?> get props => [id];
}
