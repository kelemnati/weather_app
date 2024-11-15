import 'package:weather_app/data/data_provider/data_provider.dart';
import 'package:weather_app/data/model/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider dataProvider;

  WeatherRepository({required this.dataProvider});

  Future<WeatherModel?> getWeather(String city) async {
    final data = await dataProvider.fetchWeatherData(city);

    if (data != null) {
      return WeatherModel.fromJson(data);
    } else {
      return null;
    }
  }
}
