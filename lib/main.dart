import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/data/data_provider/data_provider.dart';
import 'package:weather_app/data/repository/weather_repo.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final weatherDataProvider = WeatherDataProvider(
      baseUrl: dotenv.env['BASE_URL']!, apiKey: dotenv.env['API_KEY']!);

  final weatherRepository =
      WeatherRepository(dataProvider: weatherDataProvider);

  runApp(MyApp(
    weatherRepository: weatherRepository,
  ));
}
