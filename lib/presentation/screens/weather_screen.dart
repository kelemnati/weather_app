// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/weather_info_card.dart';
import 'package:weather_app/presentation/widgets/weather_search_input.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              WeatherSearchInput(),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is WeatherInitialSearchState) {
                    return Center(child: Text('No Data'));
                  } else if (state is WeatherLoadedState) {
                    return WeatherInfoCard(
                      weatherModel: state.weatherModel,
                    );
                  } else if (state is WeatherNoConnectionState) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wifi_off, size: 80, color: Colors.red),
                          SizedBox(height: 16),
                          Text(
                            'No internet connection',
                            style: TextStyle(fontSize: 20),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<WeatherBloc>()
                                  .add(CheckInternetConnectionEvent());
                            },
                            child: Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else if (state is WeatherErrorState) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error, size: 80, color: Colors.red),
                          SizedBox(height: 16),
                          Text(
                            state.message,
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
