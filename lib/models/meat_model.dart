import 'package:app_flutter/models/meals_model.dart';

class Meat {
  final List<Meals> meals;

  Meat({required this.meals});

  // Converte o JSON para uma instância de `Meat`
  factory Meat.fromJson(Map<String, dynamic> json) {
    return Meat(
      meals:
          List<Meals>.from(json['meals'].map((meal) => Meals.fromJson(meal))),
    );
  }
}
