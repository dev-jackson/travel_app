import 'package:flutter/material.dart';

class ResultCity {
  String _status;
  List<City> _cities;

  ResultCity({@required status, @required cities});
  ResultCity.fromJson(Map<String, dynamic> parseJson) {
    _status = parseJson['status'];
    if (parseJson['ciudades'] != null) {
      _cities = new List<City>();
      parseJson['ciudades'].forEach((e) => {_cities.add(new City.fromJson(e))});
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._cities != null) {
      data['ciudades'] = this._cities.map((e) => e.toJson()).toList();
    }
    return data;
  }

  String get status => _status;
  List<City> get cities => _cities;
}

class City {
  int _id;
  String _nombre;
  int _idProvincia;

  City.fromJson(Map<String, dynamic> parseJson) {
    this._id = parseJson['id'];
    this._nombre = parseJson['nombre'];
    this._idProvincia = parseJson['id_provincia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nombre'] = this._nombre;
    data['id_provinci'] = this._idProvincia;
    return data;
  }

  int get id => _id;
  String get nombre => _nombre;
  int get idProvincia => _idProvincia;
}
