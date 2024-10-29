import 'package:app_flutter/models/meals_model.dart'; // Certifique-se de importar o modelo correto
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.meal, // Renomeado de "meat" para "meal"
  });

  final Meals meal; // Alterado para Meals em vez de Meat

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 2, color: Colors.blue),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
              width: 100,
              height: 80,
              meal.strMealThumb), // Alterado para usar "meal"
          Text(
            meal.strMeal, // Alterado para usar "meal"
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
