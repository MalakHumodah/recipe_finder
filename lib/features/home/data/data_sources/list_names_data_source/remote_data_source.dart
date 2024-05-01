import '../../../../../services/network_service.dart';
import '../../../../../services/valid_response.dart';
import 'data_source.dart';

class RemoteDataSource implements DataListDataSource {
  NetworkService service;

  RemoteDataSource(this.service);

  @override
  Future<ValidResponse> listAreasNames() async {
    return await service.get(url: '/list.php?a=list');
  }

  @override
  Future<ValidResponse> listCategoriesNames() async {
    return await service.get(url: '/list.php?c=list');
  }
}
