part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class IntialWeatherEvent extends WeatherEvent {}

class SearchWeatherEvent extends WeatherEvent {
  final String city;

  SearchWeatherEvent({required this.city});
}

class CheckInternetConnectionEvent extends WeatherEvent {}
