import 'package:recipe_finder/features/home/domain/params/area_parameters.dart';
import 'package:recipe_finder/features/home/domain/params/category_parameter.dart';
import 'package:recipe_finder/features/home/domain/params/meal_by_name_parameter.dart';
import 'package:recipe_finder/services/network_service.dart';
import 'package:recipe_finder/services/valid_response.dart';
import 'data_source.dart';

class RemoteDataSourceImp implements FilterDataSource {
  NetworkService service;

  RemoteDataSourceImp(this.service);

  @override
  Future<ValidResponse> filterDataByArea(AreaParameters parameters) async {
    return await service.get(url: '/filter.php?a=${parameters.area}');
  }

  @override
  Future<ValidResponse> filterDataByCategory(
    CategoryParameters parameters,
  ) async {
    return await service.get(url: '/filter.php?c=${parameters.category}');
  }

  @override
  Future<ValidResponse> filterDataByName(
      MealByNameParameters parameters) async {
    return await service.get(url: '/search.php?s=${parameters.name}');
  }

  @override
  Future<ValidResponse> getRandomMeal() async {
    return await service.get(url: '/random.php');
  }

}
