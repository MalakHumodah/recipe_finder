import 'package:equatable/equatable.dart';
import 'package:recipe_finder/features/home/data/models/meal_model.dart';

import '../../data/models/ingredients_measure_model.dart';

class MealEntity extends Equatable {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strTags;
  final String strYoutube;
  final String strImageSource;
  final List<IngredientsMeasureModel> ingredientsMeasure;

  const MealEntity({
    this.ingredientsMeasure = const [],
    this.idMeal = '',
    this.strMeal = '',
    this.strCategory = '',
    this.strArea = '',
    this.strInstructions = '',
    this.strMealThumb = '',
    this.strTags = '',
    this.strYoutube = '',
    this.strImageSource = '',
  });

  factory MealEntity.fromModel(MealModel model) {
    return MealEntity(
      idMeal: model.idMeal ?? '',
      strMeal: model.strMeal ?? '',
      strCategory: model.strCategory ?? '',
      strArea: model.strArea ?? '',
      strInstructions: model.strInstructions ?? '',
      strMealThumb: model.strMealThumb ?? '',
      strTags: model.strTags ?? '',
      strYoutube: model.strYoutube ?? '',
      strImageSource: model.strImageSource ?? '',
      ingredientsMeasure: model.ingredientsMeasure,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMeal'] = idMeal;
    data['strMeal'] = strMeal;
    data['strCategory'] = strCategory;
    data['strArea'] = strArea;
    data['strInstructions'] = strInstructions;
    data['strMealThumb'] = strMealThumb;
    data['strTags'] = strTags;
    data['strYoutube'] = strYoutube;
    data['strImageSource'] = strImageSource;
    data['ingredientsMeasure'] = ingredientsMeasure;
    return data;
  }

  @override
  List<Object?> get props => [
        idMeal,
        strMeal,
        strCategory,
        strArea,
        strInstructions,
        strMealThumb,
        strTags,
        strYoutube,
        strImageSource,
        ingredientsMeasure
      ];
}

class MealsEntitiesList {
  final List<MealEntity> meals;

  MealsEntitiesList({this.meals = const []});

  factory MealsEntitiesList.fromModelList(List<MealModel> models) {
    return MealsEntitiesList(
      meals: models.map((e) => MealEntity.fromModel(e)).toList(),
    );
  }
}
