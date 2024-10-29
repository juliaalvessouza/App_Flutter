import 'dart:convert';
import 'package:app_flutter/models/meals_model.dart';
import 'package:app_flutter/models/meat_model.dart';
import 'package:http/http.dart' as http;

class MeatController {
  String baseUrl = "https://www.themealdb.com/api/json/v1/1/search.php?f=a";

  Future<List<Meals>> getAllMeats() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      if (jsonData['meals'] != null) {
        return jsonData['meals']
            .map<Meals>((meal) => Meals.fromJson(meal))
            .toList();
      } else {
        throw Exception('Nenhuma refeição encontrada.');
      }
    } else {
      throw Exception('Falha ao carregar os dados da API');
    }
  }
}
