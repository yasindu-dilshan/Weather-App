import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/weather_data.dart';
import '../repo/weather_repo.dart';
import '../repo/weather_local_repo.dart';
import '../../util/Errors.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _weatherRepo = new WeatherRepo();

  WeatherBloc() : super(Initial()) {
    add(GetWeatherEvent());
  }

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeatherEvent) {
      yield Loading();
      try {
        final response = await _weatherRepo.getWeather();
        await WeatherLocalRepo.setWeather(response);
        yield Loaded(weatherModel: response);
      } on ServrerError {
        try {
          final response = await WeatherLocalRepo.getWeatherModel();
          yield LoadedError(
              weatherModel: response, error: 'Database Connection Error!');
        } catch (CacheError) {
          yield ErrorState();
        }
      } on InternetConnectionError {
        try {
          final response = await WeatherLocalRepo.getWeatherModel();
          yield LoadedError(
              weatherModel: response, error: 'Internet Connection Error!');
        } catch (CacheError) {
          yield ErrorState();
        }
      }
    }
  }
}
