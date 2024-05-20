import 'package:dartz/dartz.dart';
import 'package:recipe_finder/features/home/domain/home_domain.export.dart';

abstract class MealsRepository {
  Future<Either<String, MealsEntitiesList>> getMealsByName(
      MealByNameParameters parameters);

  Future<MealsEntitiesList> getMealsByArea(AreaParameters parameters);

  Future<MealsEntitiesList> getMealsByCategory(CategoryParameters parameters);

  Future<Either<String, MealEntity>> getRandomMeal();
}
