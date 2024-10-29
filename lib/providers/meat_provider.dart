import 'package:app_flutter/controller/meat_controller.dart';
import 'package:app_flutter/models/meals_model.dart';
import 'package:flutter/material.dart';

class MeatProvider with ChangeNotifier {
  final MeatController _meatController = MeatController();
  List<Meals> _meats = []; // Alterado para List<Meals>

  bool _isLoading = true;
  bool _hasError = false;

  List<Meals> get allMeats => _meats; // Alterado para List<Meals>
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  MeatProvider() {
    fetchMeats();
  }

  Future<void> fetchMeats() async {
    try {
      _isLoading = true;
      notifyListeners();

      List<Meals> products = await _meatController.getAllMeats();
      _meats = products;

      _isLoading = false;
      _hasError = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _hasError = true;
      notifyListeners();
    }
  }
}
