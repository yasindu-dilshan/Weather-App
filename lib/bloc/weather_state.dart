part of 'weather_bloc.dart';


abstract class WeatherState {}

class Initial extends WeatherState {}

class Loading extends WeatherState {}

class ErrorState extends WeatherState {}

class Loaded extends WeatherState {
  final Weather weatherModel;

  Loaded({ required this.weatherModel});
}

class LoadedError extends WeatherState {
  final Weather weatherModel;
  final String error;

  LoadedError({required this.weatherModel, required this.error});
}
