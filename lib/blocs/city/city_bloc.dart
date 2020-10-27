import 'package:control_travel/blocs/city/city_event.dart';
import 'package:control_travel/blocs/city/city_state.dart';
import 'package:control_travel/model/city.dart';
import 'package:control_travel/resources/respository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  Repository repository;
  CitiesBloc({@required this.repository}) : super(null);

  @override
  CitiesState get initialState => CitiesInitialState();

  @override
  Stream<CitiesState> mapEventToState(CitiesEvent event) async* {
    if (event is FetchCitiesEvent) {
      yield CitiesLoadingState();
      try {
        List<City> cities = await repository.fetchAllCities();
        yield CitiesLoadedState(cities: cities);
      } catch (e) {
        yield CitiesErrorState(msg: e.toString());
      }
    }
  }
}
