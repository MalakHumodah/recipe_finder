import 'package:equatable/equatable.dart';

import '../../domain/entity/meal_entity.dart';

enum HomeStateStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final List<String> categoriesNames;
  final List<String> areasNames;
  final HomeStateStatus homeStateStatus;
  final List<MealEntity> meals;
  final MealEntity mealEntity;
  final String errorMessage;

  const HomeState({
    this.errorMessage = '',
    this.categoriesNames = const [],
    this.areasNames = const [],
    this.mealEntity = const MealEntity(),
    this.homeStateStatus = HomeStateStatus.initial,
    this.meals = const [],
  });

  HomeState copyWith({
    String? errorMessage,
    List<String>? categoriesNames,
    List<String>? areasNames,
    List<MealEntity>? meals,
    MealEntity? mealEntity,
    HomeStateStatus? homeStateStatus,
  }) {
    return HomeState(
      errorMessage: errorMessage ?? this.errorMessage,
      categoriesNames: categoriesNames ?? this.categoriesNames,
      areasNames: areasNames ?? this.areasNames,
      meals: meals ?? this.meals,
      mealEntity: mealEntity ?? this.mealEntity,
      homeStateStatus: homeStateStatus ?? this.homeStateStatus,
    );
  }

  @override
  List<Object?> get props => [
        meals,
        homeStateStatus,
        mealEntity,
        categoriesNames,
        areasNames,
        errorMessage,
      ];
}
