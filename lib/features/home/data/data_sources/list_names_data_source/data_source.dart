import 'package:recipe_finder/services/valid_response.dart';


abstract class DataListDataSource {
  Future<ValidResponse> listCategoriesNames();

  Future<ValidResponse> listAreasNames();
}