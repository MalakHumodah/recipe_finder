import 'package:equatable/equatable.dart';
import 'package:recipe_finder/features/home/domain/entity/meal_entity.dart';

enum RandomPageStatus { loading, error, success, initial }

class RandomMealState extends Equatable {
  final MealEntity mealEntity;
  final RandomPageStatus randomPageStatus;

  const RandomMealState({
    this.randomPageStatus = RandomPageStatus.initial,
    this.mealEntity = const MealEntity(),
  });

  RandomMealState copyWith({
    MealEntity? mealEntity,
    RandomPageStatus? randomPageStatus,
  }) {
    return RandomMealState(
      mealEntity: mealEntity ?? this.mealEntity,
      randomPageStatus: randomPageStatus ?? this.randomPageStatus,
    );
  }

  @override
  List<Object?> get props => [mealEntity, randomPageStatus];
}
