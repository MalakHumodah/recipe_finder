import 'package:recipe_finder/features/home/domain/entity/meal_entity.dart';
import 'package:recipe_finder/features/home/domain/params/area_parameters.dart';
import 'package:recipe_finder/features/home/domain/params/category_parameter.dart';
import '../params/meal_by_name_parameter.dart';

abstract class MealsRepository {
  Future<MealsEntitiesList> getMealsByName(MealByNameParameters parameters);

  Future<MealsEntitiesList> getMealsByArea(AreaParameters parameters);

  Future<MealsEntitiesList> getMealsByCategory(CategoryParameters parameters);

  Future<MealEntity> getRandomMeal();
}
