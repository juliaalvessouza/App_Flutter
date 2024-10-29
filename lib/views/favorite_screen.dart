import 'package:app_flutter/providers/favorite_provider.dart';
import 'package:app_flutter/views/widgets/meats_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: favoriteProvider.favoriteMeats.isEmpty
          ? const Center(child: Text("Nenhuma receita nos favoritos"))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: favoriteProvider.favoriteMeats.length,
              itemBuilder: (BuildContext context, int index) {
                final meals = favoriteProvider.favoriteMeats[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MeatsDetails(meals: meals),
                    ));
                  },
                  child: ListTile(
                    leading: Image.network(meals.strMealThumb.toString()),
                    title: Text(meals.strMeal),
                    trailing: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                );
              },
            ),
    );
  }
}
