import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../model/asiento.dart';
import '../model/city.dart';

class ApiProvider {
  Client client = Client();

  Future<List<City>> fetchCiudadList() async {
    final res = await client.get("https://jacknz.tk/api/ciudades");
    if (res.statusCode == 200) {
      return ResultCity.fromJson(json.decode(res.body)).cities;
    } else {
      throw Exception("Falied");
    }
  }
}
