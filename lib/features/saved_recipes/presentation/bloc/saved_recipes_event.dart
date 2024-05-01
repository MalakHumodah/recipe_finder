import 'package:recipe_finder/features/home/domain/entity/meal_entity.dart';

abstract class SavedRecipesEvent {}

class GetSavedRecipes extends SavedRecipesEvent {}

class RemoveRecipe extends SavedRecipesEvent {
  final MealEntity mealEntity;

  RemoveRecipe(this.mealEntity);
}

class SaveRecipe extends SavedRecipesEvent {
  final MealEntity mealEntity;

  SaveRecipe(this.mealEntity);
}
