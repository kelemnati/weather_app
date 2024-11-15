part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherInitialSearchState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherErrorState extends WeatherState {
  final String message;
  WeatherErrorState(this.message);
}

class WeatherNoConnectionState extends WeatherState {}
