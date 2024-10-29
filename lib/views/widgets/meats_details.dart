import 'package:app_flutter/models/meals_model.dart';
import 'package:app_flutter/models/meat_model.dart';
import 'package:app_flutter/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeatsDetails extends StatelessWidget {
  const MeatsDetails({
    super.key,
    required this.meals,
  });

  final Meals meals;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    bool isFavorite = favoriteProvider.isFavorite(meals);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Detalhes da Receita"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                  height: 300,
                  width: double.infinity,
                  meals.strMealThumb.toString()),
              Positioned(
                right: 20,
                top: 10,
                child: IconButton(
                  onPressed: () {
                    // Adicionar ou remover dos favoritos
                    if (isFavorite) {
                      favoriteProvider.removeFavoriteMeat(meals);
                    } else {
                      favoriteProvider.addFavoriteMeat(meals);
                    }
                  },
                  icon: const Icon(Icons.favorite),
                  color: isFavorite ? Colors.red : null,
                ),
              )
            ],
          ),
          Container(
            color: const Color.fromARGB(255, 75, 74, 74),
            child: Text(meals.strMeal),
          ),
          Text(meals.strCategory),
          Text(meals.strArea),
          Text(meals.strInstructions),
        ],
      ),
    );
  }
}
