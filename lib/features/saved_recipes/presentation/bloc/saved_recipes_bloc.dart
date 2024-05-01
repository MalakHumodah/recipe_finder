import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/features/home/data/models/meal_model.dart';
import 'package:recipe_finder/features/home/domain/entity/meal_entity.dart';
import 'package:recipe_finder/features/saved_recipes/presentation/bloc/saved_recipes_event.dart';
import 'package:recipe_finder/features/saved_recipes/presentation/bloc/saved_recipes_state.dart';
import '../../../../core/constants/keys.dart';
import '../../../../services/shared_service.dart';

class SavedRecipesBloc extends Bloc<SavedRecipesEvent, SavedRecipesState> {
  SavedRecipesBloc() : super(const SavedRecipesState()) {
    on<GetSavedRecipes>(_getSavedRecipes);
    on<SaveRecipe>(_saveRecipe);
    on<RemoveRecipe>(_removeRecipe);

    add(GetSavedRecipes());
  }

  FutureOr<void> _getSavedRecipes(
      GetSavedRecipes event, Emitter<SavedRecipesState> emit) async {
    emit(state.copyWith(savedScreenStatus: SavedScreenStatus.loading));
    List<MealEntity> savedMeals = [];
    List<String>? data = Prefs.getStringList(Keys.savedRecipesKey);

    if (data != null) {
      for (var recipe in data) {
        savedMeals.add(
          MealEntity.fromModel(
            MealModel.fromResponse(
              json.decode(recipe),
            ),
          ),
        );
      }
      emit(state.copyWith(
        savedScreenStatus: SavedScreenStatus.success,
        savedRecipes: savedMeals,
      ));
    }
  }

  FutureOr<void> _saveRecipe(
      SaveRecipe event, Emitter<SavedRecipesState> emit) async {
    emit(state.copyWith(savedScreenStatus: SavedScreenStatus.loading));
    List<MealEntity> savedList = [];
    List<String>? encodedData = [];

    savedList.addAll(state.savedRecipes);
    savedList.add(event.mealEntity);

    for (var item in savedList) {
      encodedData.add(
        json.encode(item.toJson()),
      );
    }

    await Prefs.setStringList(Keys.savedRecipesKey, encodedData);
    emit(state.copyWith(
      savedScreenStatus: SavedScreenStatus.success,
      savedRecipes: savedList,
    ));
  }

  FutureOr<void> _removeRecipe(
      RemoveRecipe event, Emitter<SavedRecipesState> emit) async {
    List<MealEntity> savedList = [];
    List<String>? encodedData = [];


    savedList.addAll(state.savedRecipes);
    //savedList.remove(event.mealEntity);
    for (var meal in state.savedRecipes) {
      if (event.mealEntity.idMeal == meal.idMeal) {
        savedList.remove(meal);
      }
    }

    for (var item in savedList) {
      encodedData.add(jsonEncode(item.toJson()));
    }
    await Prefs.setStringList(Keys.savedRecipesKey, encodedData);
    emit(state.copyWith(
      savedScreenStatus: SavedScreenStatus.success,
      savedRecipes: savedList,
    ));
  }
}
