import 'package:dartz/dartz.dart';
import 'package:recipe_finder/features/home/domain/home_domain.export.dart';

class GetMealsUseCases
    extends RecipesUseCase<MealsEntitiesList, MealByNameParameters> {
  MealsRepository mealsRepository;
  MealsListRepository mealsListRepository;

  GetMealsUseCases(
      {required this.mealsRepository, required this.mealsListRepository});

  @override
  Future<Either<String, MealsEntitiesList>> call(MealByNameParameters parameters) async {
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

  Future<Either<String, MealEntity>> getRandomMealUseCase() async {
    return await mealsRepository.getRandomMeal();
  }

  Future<List<String>> getAreasListNamesUseCase() async {
    return await mealsListRepository.listAreasNames();
  }

  Future<List<String>> getCategoriesListNamesUseCase() async {
    return await mealsListRepository.listCategoriesName();
  }
}
