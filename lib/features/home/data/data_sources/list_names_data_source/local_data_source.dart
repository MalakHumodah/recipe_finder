import 'package:recipe_finder/core/constants/keys.dart';
import 'package:recipe_finder/services/valid_response.dart';
import '../../../../../services/shared_service.dart';
import 'data_source.dart';

class LocalDataSource implements DataListDataSource {
  @override
  Future<ValidResponse> listAreasNames() async {
    final responseBody = Prefs.getStringList(Keys.areasNamesKey);
    return ValidResponse(body: responseBody);
  }

  @override
  Future<ValidResponse> listCategoriesNames() async {
    final responseBody = Prefs.getStringList(Keys.categoriesNamesKey);
    return ValidResponse(body: responseBody);
  }
}
