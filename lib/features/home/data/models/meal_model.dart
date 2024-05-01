import 'package:recipe_finder/features/home/data/models/ingredients_measure_model.dart';

class MealModel {
  final String? idMeal;
  final String? strMeal;
  final String? strDrinkAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<IngredientsMeasureModel> ingredientsMeasure;
  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;

  MealModel({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.ingredientsMeasure = const [],
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory MealModel.fromResponse(Map<String, dynamic> json) {
    List<IngredientsMeasureModel> ingredientsMeasure = [];
    for (int i = 1; i <= 20; i++) {
      if (json['strIngredient$i'] != null && json['strIngredient$i'] != '') {
        ingredientsMeasure.add(
          IngredientsMeasureModel.fromResponse(
            {
              'strIngredients': json['strIngredient$i'],
              'strMeasure': json['strMeasure$i'],
            },
          ),
        );
      }
    }
    return MealModel(
      ingredientsMeasure: ingredientsMeasure,
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strDrinkAlternate: json['strDrinkAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      strSource: json['strSource'],
      strImageSource: json['strImageSource'],
      strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified'],
    );
  }
}

class MealsModelsList {
  final List<MealModel> meals;

  MealsModelsList({this.meals = const []});

  factory MealsModelsList.fromJson(List<dynamic> json) => MealsModelsList(
        meals: json.map((e) => MealModel.fromResponse(e)).toList(),
      );
}
