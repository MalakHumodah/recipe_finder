import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/features/home/domain/entity/meal_entity.dart';
import 'package:recipe_finder/features/random_recipe/presentation/bloc/random_meal_event.dart';
import 'package:recipe_finder/features/random_recipe/presentation/bloc/random_meal_state.dart';
import '../../../home/domain/use_cases/get_meals_usecases.dart';

class RandomMealBloc extends Bloc<RandomMealEvent, RandomMealState> {
  final GetMealsUseCases getMealsUseCases;

  RandomMealBloc(this.getMealsUseCases) : super(const RandomMealState()) {
    on<GetRandomMeal>(_getRandomMeal);

    add(GetRandomMeal());
  }

  FutureOr<void> _getRandomMeal(
      GetRandomMeal event, Emitter<RandomMealState> emit) async {
    emit(state.copyWith(randomPageStatus: RandomPageStatus.loading));

    MealEntity meal;
    meal = await getMealsUseCases.getRandomMealUseCase();
    emit(state.copyWith(
      mealEntity: meal,
      randomPageStatus: RandomPageStatus.success,
    ));
  }
}
