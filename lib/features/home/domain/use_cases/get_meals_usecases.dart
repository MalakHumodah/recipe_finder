import 'package:recipe_finder/core/utils/recipe_use_cases.dart';
import 'package:recipe_finder/features/home/domain/entity/meal_entity.dart';
import 'package:recipe_finder/features/home/domain/params/area_parameters.dart';
import 'package:recipe_finder/features/home/domain/params/category_parameter.dart';
import '../params/meal_by_name_parameter.dart';
import '../repositories/data_filter_repo.dart';
import '../repositories/data_list_repo.dart';

class GetMealsUseCases
    extends RecipesUseCase<MealsEntitiesList, MealByNameParameters> {
  MealsRepository mealsRepository;
  MealsListRepository mealsListRepository;

  GetMealsUseCases(
      {required this.mealsRepository, required this.mealsListRepository});

  @override
  Future<MealsEntitiesList> call(MealByNameParameters parameters) async {
    return await mealsRepository.getMealsByName(parameters);
  }

  Future<MealsEntitiesList> getMealsByCategoryUseCase(
      CategoryParameters parameters) async {
    return await mealsRepository.getMealsByCategory(parameters);
  }

  Future<MealsEntitiesList> getMealsByAreaUseCase(
      AreaParameters parameters) async {
    return await mealsRepository.getMealsByArea(parameters);
  }

  Future<MealEntity> getRandomMealUseCase() async {
    return await mealsRepository.getRandomMeal();
  }

  Future<List<String>> getAreasListNamesUseCase() async {
    return await mealsListRepository.listAreasNames();
  }

  Future<List<String>> getCategoriesListNamesUseCase() async {
    return await mealsListRepository.listCategoriesName();
  }
}
