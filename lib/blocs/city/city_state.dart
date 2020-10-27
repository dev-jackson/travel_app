import 'package:control_travel/model/city.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CitiesState extends Equatable {}

class CitiesInitialState extends CitiesState {
  @override
  List<Object> get props => [];
}

class CitiesLoadingState extends CitiesState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// ignore: must_be_immutable
class CitiesLoadedState extends CitiesState {
  List<City> cities;
  CitiesLoadedState({@required this.cities});

  @override
  List<Object> get props => [cities];
}

// ignore: must_be_immutable
class CitiesErrorState extends CitiesState {
  String msg;
  CitiesErrorState({@required this.msg});

  @override
  List<Object> get props => [msg];
}
