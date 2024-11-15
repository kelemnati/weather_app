import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';

class WeatherSearchInput extends StatelessWidget {
  const WeatherSearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cityController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: cityController,
            decoration: InputDecoration(
              labelText: 'Enter city name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final city = cityController.text;
              if (city.isNotEmpty) {
                final city = cityController.text;
                context.read<WeatherBloc>().add(SearchWeatherEvent(city: city));
              }
            },
            child: Text('Search Weather'),
          ),
        ],
      ),
    );
  }
}
