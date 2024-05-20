import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    final result = await getMealsUseCases.getRandomMealUseCase();
    // MealEntity meal;
    // meal = await getMealsUseCases.getRandomMealUseCase();

    result.fold(
      (l) => emit(
        state.copyWith(
          errorMessage: l,
          randomPageStatus: RandomPageStatus.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          mealEntity: r,
          randomPageStatus: RandomPageStatus.success,
        ),
      ),
    );
    // emit(state.copyWith(
    // mealEntity: meal,
    // randomPageStatus: RandomPageStatus.success,
    // ));
  }
}
