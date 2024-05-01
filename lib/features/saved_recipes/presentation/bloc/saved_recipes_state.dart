import 'package:equatable/equatable.dart';
import 'package:recipe_finder/features/home/domain/entity/meal_entity.dart';

enum SavedScreenStatus { initial, loading, success, error }

class SavedRecipesState extends Equatable {
  final List<MealEntity> savedRecipes;
  final SavedScreenStatus savedScreenStatus;

  const SavedRecipesState({
    this.savedRecipes = const [],
    this.savedScreenStatus = SavedScreenStatus.initial,
  });

  SavedRecipesState copyWith({
    List<MealEntity>? savedRecipes,
    SavedScreenStatus? savedScreenStatus,
  }) {
    return SavedRecipesState(
      savedRecipes: savedRecipes ?? this.savedRecipes,
      savedScreenStatus: savedScreenStatus ?? this.savedScreenStatus,
    );
  }

  @override
  List<Object?> get props => [savedRecipes, savedScreenStatus];
}
