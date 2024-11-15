import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/data/repository/weather_repo.dart';
import 'package:weather_app/presentation/screens/weather_screen.dart';

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const MyApp({required this.weatherRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherBloc(weatherRepository)..add(IntialWeatherEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WeatherScreen(),
      ),
    );
  }
}
