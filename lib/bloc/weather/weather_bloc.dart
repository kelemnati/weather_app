import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/repository/weather_repo.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitialSearchState()) {
    on<IntialWeatherEvent>(intialWeatherEvent);

    on<SearchWeatherEvent>(searchWeatherEvent);

    on<CheckInternetConnectionEvent>(checkInternetConnectionEvent);
  }

  Future<void> intialWeatherEvent(
      IntialWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    add(CheckInternetConnectionEvent());
    await Future.delayed(const Duration(seconds: 3));
  }

  // Search event to fetch weather data
  Future<void> searchWeatherEvent(
      SearchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState()); // Show loading indicator during search

    // Check internet connection
    bool isConnected = await _checkInternetConnection();
    if (!isConnected) {
      emit(WeatherNoConnectionState()); // Emit no connection state
      return;
    }

    try {
      // Fetch weather data from repository
      final weather = await weatherRepository.getWeather(event.city);
      if (weather != null) {
        emit(WeatherLoadedState(weatherModel: weather)); // Emit loaded state
      } else {
        emit(WeatherErrorState(
            "Failed to fetch weather data; Please try again")); // Emit error state
      }
    } catch (e) {
      emit(WeatherErrorState(
          "An error occurred: $e")); // Emit error on exception
    }
  }

  // Event handler for checking internet connection
  Future<void> checkInternetConnectionEvent(
      CheckInternetConnectionEvent event, Emitter<WeatherState> emit) async {
    bool isConnected = await _checkInternetConnection();
    if (isConnected) {
      emit(
          WeatherInitialSearchState()); // Continue to search state if connected
    } else {
      emit(WeatherNoConnectionState()); // No internet connection state
    }
  }

  // Private helper method to check internet connectivity
  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
