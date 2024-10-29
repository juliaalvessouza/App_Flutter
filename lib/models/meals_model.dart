class Meals {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;

  Meals(
      {required this.idMeal,
      required this.strMeal,
      required this.strCategory,
      required this.strArea,
      required this.strInstructions,
      required this.strMealThumb});

  //Converter o json para uma instancia de produto que vem da API

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
        idMeal: json['idMeal'],
        strMeal: json['strMeal'],
        strCategory: json['strCategory'],
        strArea: json['strArea'],
        strInstructions: json['strInstructions'],
        strMealThumb: json['strMealThumb']);
  }
}
