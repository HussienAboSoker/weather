

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/cubit_get_wheather.dart';
import 'package:weather/cubits/weather_sate_cubite.dart';
import 'package:weather/widgets/current_weather.dart';
import 'package:weather/widgets/noWeather.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Weather"), actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
            icon: const Icon(Icons.search),
          ),
        ]),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return const NoWeather();
            } else if (state is WeatherLoadedSteate) {
              return CurrentWheather(
                weather: state.weatherModel,
              );
            } else {
              return const Text("oop there is an error");
            }
          },
        ));
  }
}
