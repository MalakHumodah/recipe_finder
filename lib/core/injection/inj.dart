import 'package:get_it/get_it.dart';
import 'package:recipe_finder/services/network_service.dart';
import '../../features/home/data/data_sources/filter_data_source/remote_datasource.dart'
    as filter_data_source;
import '../../features/home/data/data_sources/list_names_data_source/local_data_source.dart'
    as data_list_local;
import '../../features/home/data/data_sources/list_names_data_source/remote_data_source.dart'
    as data_list_remote;
import '../../features/home/data/repositories/data_filter_repo_imp.dart';
import '../../features/home/data/repositories/data_list_repo_imp.dart';

import '../../features/home/domain/use_cases/get_meals_usecases.dart';

final getIt = GetIt.instance;

class InitializeDependencies {
  void init() {
    final service = NetworkService();

    //dataList Data source
    final localDataSource = data_list_local.LocalDataSource();
    final dataListRemoteDataSource = data_list_remote.RemoteDataSource(service);

    //filter Data source
    final filterRemoteDataSource =
        filter_data_source.RemoteDataSourceImp(service);

    //repos
    final filterRepo = MealsRepositoryImp(filterRemoteDataSource);
    final dataListRepo =
        DataListRepositoryImp(localDataSource, dataListRemoteDataSource);

    //use cases
    getIt.registerLazySingleton(() => GetMealsUseCases(
          mealsRepository: filterRepo,
          mealsListRepository: dataListRepo,
        ));
  }
}
