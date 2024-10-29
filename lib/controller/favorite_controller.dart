import 'package:app_flutter/models/meat_model.dart';

class FavoriteController {
  final List<Meat> favoriteMeats = [];

  List<Meat> allFavorites() {
    return favoriteMeats;
  }

  void addToFavoritesList(Meat meat) {
    if (!favoriteMeats.contains(meat)) {
      favoriteMeats.add(meat);

      print(favoriteMeats.length);
    }
  }

  void removeToFavoritesList(Meat meat) {
    if (favoriteMeats.contains(meat)) {
      favoriteMeats.remove(meat);
    }
  }
}
