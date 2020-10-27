class Asiento {
  int _id;
  String _nombre;

  Asiento.fromJson(Map<String, dynamic> parseJson) {
    _id = parseJson['id'];
    _nombre = parseJson['nombre'];
  }

  int get id => _id;
  String get nombre => _nombre;
}
