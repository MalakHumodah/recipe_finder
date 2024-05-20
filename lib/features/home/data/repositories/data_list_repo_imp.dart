import 'dart:convert';
import '../../../../core/constants/keys.dart';
import '../../../../services/shared_service.dart';
import '../../domain/repositories/data_list_repo.dart';
import '../data_sources/list_names_data_source/local_data_source.dart';
import '../data_sources/list_names_data_source/remote_data_source.dart';
import 'package:recipe_finder/features/home/data/home_data.export.dart';


class DataListRepositoryImp implements MealsListRepository {
  LocalDataSource localDataSource;
  RemoteDataSource remoteDataSource;

  DataListRepositoryImp(this.localDataSource, this.remoteDataSource);

  @override
  Future<List<String>> listAreasNames() async {
    List<String> dataList = [];
    ValidResponse response = await localDataSource.listAreasNames();

    if (response.body == null) {
      response = await remoteDataSource.listAreasNames();
      Map<String, dynamic> decodedBody = json.decode(response.body);
      for (var json in decodedBody["meals"]) {
        dataList.add(json['strArea']);
      }
      await Prefs.setStringList(Keys.areasNamesKey, dataList);
      return dataList;
    }
    return response.body;
  }

  @override
  Future<List<String>> listCategoriesName() async {
    List<String> dataList = [];
    ValidResponse response = await localDataSource.listCategoriesNames();

    if (response.body == null) {
      response = await remoteDataSource.listCategoriesNames();
      Map<String, dynamic> decodedBody = json.decode(response.body);
      for (var json in decodedBody["meals"]) {
        dataList.add(json['strCategory']);
      }
      await Prefs.setStringList(Keys.categoriesNamesKey, dataList);
      return dataList;
    }
    return response.body;
  }
}
