import 'package:equatable/equatable.dart';
import 'package:recipe_finder/features/home/domain/entity/meal_entity.dart';

enum RandomPageStatus { loading, error, success, initial }

class RandomMealState extends Equatable {
  final MealEntity mealEntity;
  final RandomPageStatus randomPageStatus;
  final String errorMessage;

  const RandomMealState({
    this.errorMessage = '',
    this.randomPageStatus = RandomPageStatus.initial,
    this.mealEntity = const MealEntity(),
  });

  RandomMealState copyWith({
    MealEntity? mealEntity,
    RandomPageStatus? randomPageStatus,
    String? errorMessage,
  }) {
    return RandomMealState(
      mealEntity: mealEntity ?? this.mealEntity,
      randomPageStatus: randomPageStatus ?? this.randomPageStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [mealEntity, randomPageStatus, errorMessage];
}
