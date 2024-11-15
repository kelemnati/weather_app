import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherDataProvider {
  final String baseUrl;
  final String apiKey;

  WeatherDataProvider({required this.baseUrl, required this.apiKey});

  Future<Map<String, dynamic>?> fetchWeatherData(String city) async {
    // Construct the URI correctly
    final uri = Uri.https(baseUrl, '/data/2.5/weather', {
      'q': city,
      'appid': apiKey,
      'units': 'metric',
    });

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        // Log the error if needed
        print('Failed to fetch data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
