import 'package:flutter/material.dart';

class ResultUser {
  String _status;
  User _user;
  String _msg;

  ResultUser({String status, User user, String msg})
      : _status = status,
        _user = user,
        _msg = msg;

  ResultUser.fromJson(Map<String, dynamic> parseJson) {
    this._status = parseJson['status'];
    if (parseJson['user'] != null) {
      this._user = new User();
    } else {
      this._msg = parseJson['mensaje'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._user != null) {
      data['user'] = this._user.toJson();
    } else {
      data['mensaje'] = this._msg;
    }
    return data;
  }

  String get status => _status;
  User get user => _user;
  String get msg => _msg;
}

class User {
  int _id;
  String _nombre;
  String _fechaNac;
  String _celular;
  int _idCity;

  User({int id, String nombre, String fechaNac, String celular, int idCity})
      : _id = id,
        _nombre = nombre,
        _fechaNac = celular,
        _idCity = idCity;
  User.fromJson(Map<String, dynamic> parseJson) {
    this._id = parseJson['id'];
    this._nombre = parseJson['nombre'];
    this._fechaNac = parseJson['fecha_nac'];
    this._celular = parseJson['ncelular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nombre'] = this._nombre;
    data['fecha_nac'] = this._fechaNac;
    data['ncelular'] = this._celular;
    data['id_ciudad'] = this._idCity;
    return data;
  }

  int get id => _id;
  String get nombre => _nombre;
  String get fechaNac => _fechaNac;
  String get celular => _celular;
  int get idCity => _idCity;
}
