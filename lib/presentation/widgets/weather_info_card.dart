import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/model/weather_model.dart';

class WeatherInfoCard extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherInfoCard({super.key, required this.weatherModel});

  IconData _getWeatherIcon(String description, double temperature) {
    if (description.contains("rain")) {
      return Icons.beach_access;
    } else if (description.contains("cloud")) {
      return Icons.cloud;
    } else if (description.contains("clear") || temperature > 25) {
      return Icons.wb_sunny;
    } else if (description.contains("snow")) {
      return Icons.ac_unit;
    } else if (temperature < 0) {
      return Icons.ac_unit;
    } else {
      return Icons.wb_cloudy;
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, d MMMM').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.city,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 4),
            Text(
              formattedDate,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),

            // Weather icon (replace with actual icon depending on weather)
            Icon(
              _getWeatherIcon(
                  weatherModel.weatherDescription, weatherModel.temperature),
              size: 80,
              color: Colors.orangeAccent,
            ),
            SizedBox(height: 20),

            // Temperature display
            Text(
              '${weatherModel.temperature.toStringAsFixed(0)}°',
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.w300,
                color: Colors.orangeAccent,
              ),
            ),
            SizedBox(height: 8),

            // Weather description
            Text(
              weatherModel.weatherDescription,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),

            SizedBox(height: 8),
            Text(
              'Feels like ${weatherModel.feelsLike.toStringAsFixed(0)}°',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
