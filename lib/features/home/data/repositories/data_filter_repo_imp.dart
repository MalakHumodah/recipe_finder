import 'dart:convert';
import 'package:recipe_finder/features/home/data/models/meal_model.dart';
import 'package:recipe_finder/features/home/domain/params/area_parameters.dart';
import 'package:recipe_finder/features/home/domain/params/category_parameter.dart';
import 'package:recipe_finder/features/home/domain/repositories/data_filter_repo.dart';
import '../../domain/entity/meal_entity.dart';
import '../../domain/params/meal_by_name_parameter.dart';
import '../data_sources/filter_data_source/remote_datasource.dart';

class MealsRepositoryImp implements MealsRepository {
  RemoteDataSourceImp remoteDataSource;

  MealsRepositoryImp(
    this.remoteDataSource,
  );

  @override
  Future<MealsEntitiesList> getMealsByArea(AreaParameters parameters) async {
    final response = await remoteDataSource.filterDataByArea(parameters);
    Map<String, dynamic> decodedBody = json.decode(response.body);
    var meals = MealsEntitiesList.fromModelList(
        MealsModelsList.fromJson(decodedBody["meals"]).meals);

    return meals;
  }

  @override
  Future<MealsEntitiesList> getMealsByCategory(
      CategoryParameters parameters) async {
    final response = await remoteDataSource.filterDataByCategory(parameters);
    Map<String, dynamic> decodedBody = json.decode(response.body);

    var mealsList = MealsEntitiesList.fromModelList(
        MealsModelsList.fromJson(decodedBody["meals"]).meals);
    // List<MealEntity> entityData = [];
    // for (var json in decodedBody["meals"]) {
    //   entityData.add(MealEntity.fromModel(MealModel.fromResponse(json)));
    // }
    return mealsList;
  }

  @override
  Future<MealsEntitiesList> getMealsByName(
      MealByNameParameters parameters) async {
    final validResponse = await remoteDataSource.filterDataByName(parameters);
    MealsEntitiesList meals = MealsEntitiesList();
    Map<String, dynamic> decodedBody = json.decode(validResponse.body);

    if (decodedBody["meals"] != null) {
      meals = MealsEntitiesList.fromModelList(
          MealsModelsList.fromJson(decodedBody["meals"]).meals);
    }
    return meals;
  }

  @override
  Future<MealEntity> getRandomMeal() async {
    final response = await remoteDataSource.getRandomMeal();
    Map<String, dynamic> decodedBody = json.decode(response.body);

    var meals = MealsEntitiesList.fromModelList(
        MealsModelsList.fromJson(decodedBody["meals"]).meals);

    return meals.meals.first;
  }
}
