import 'package:recipe_finder/features/home/domain/params/area_parameters.dart';
import 'package:recipe_finder/features/home/domain/params/category_parameter.dart';

import '../../../../../services/valid_response.dart';
import '../../../domain/params/meal_by_name_parameter.dart';

abstract class FilterDataSource {
  Future<ValidResponse> filterDataByName(MealByNameParameters parameters);

  Future<ValidResponse> filterDataByArea(AreaParameters parameters);

  Future<ValidResponse> filterDataByCategory(CategoryParameters parameters);



  Future<ValidResponse> getRandomMeal();
}
