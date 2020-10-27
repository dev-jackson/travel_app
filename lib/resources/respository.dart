import 'dart:async';
import 'api_provider.dart';
import '../model/city.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<List<City>> fetchAllCities() => apiProvider.fetchCiudadList();
}
