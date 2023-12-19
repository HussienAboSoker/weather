import 'package:weather/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedSteate extends WeatherState {
  WeatherModel weatherModel;
  WeatherLoadedSteate(this.weatherModel);
}

class WeatherFaiureState extends WeatherState {}
