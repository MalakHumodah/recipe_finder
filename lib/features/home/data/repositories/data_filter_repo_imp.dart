import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:recipe_finder/features/home/data/home_data.export.dart';

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
    return mealsList;
  }

  @override
  Future<Either<String, MealsEntitiesList>> getMealsByName(
      MealByNameParameters parameters) async {
    final validResponse = await remoteDataSource.filterDataByName(parameters);
    MealsEntitiesList meals = MealsEntitiesList();
    Map<String, dynamic> decodedBody = json.decode(validResponse.body);
    if (decodedBody["meals"] != null) {
      meals = MealsEntitiesList.fromModelList(
          MealsModelsList.fromJson(decodedBody["meals"]).meals);
      return Right(meals);
    }
    return left('Recipe Not Found');
  }

  @override
  Future<Either<String, MealEntity>> getRandomMeal() async {
    final response = await remoteDataSource.getRandomMeal();
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedBody = json.decode(response.body);
      var meals = MealsEntitiesList.fromModelList(
          MealsModelsList.fromJson(decodedBody["meals"]).meals);
      return Right(meals.meals.first);
    }
    return left('${response.message}');
  }
}
