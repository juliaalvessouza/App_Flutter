import 'package:app_flutter/models/meals_model.dart';
import 'package:app_flutter/models/meat_model.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Meals> _favoriteMeats = [];
  List<Meals> get favoriteMeats => _favoriteMeats;

  void addFavoriteMeat(Meals meals) {
    if (!_favoriteMeats.contains(meals)) {
      _favoriteMeats.add(meals);
      notifyListeners();
    }
  }

  void removeFavoriteMeat(Meals meals) {
    _favoriteMeats.remove(meals);
    notifyListeners();
  }

  bool isFavorite(Meals meals) {
    return _favoriteMeats.contains(meals);
  }
}
