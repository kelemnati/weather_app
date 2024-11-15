class WeatherModel {
  final String city;
  final double temperature;
  final double feelsLike;
  final double minTemp;
  final double maxTemp;
  final int humidity;
  final int pressure;
  final String weatherDescription;
  final double windSpeed;

  WeatherModel(
      {required this.city,
      required this.temperature,
      required this.feelsLike,
      required this.minTemp,
      required this.maxTemp,
      required this.humidity,
      required this.pressure,
      required this.weatherDescription,
      required this.windSpeed});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      minTemp: json['main']['temp_min'].toDouble(),
      maxTemp: json['main']['temp_max'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      weatherDescription: json['weather'][0]['description'],
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
}
