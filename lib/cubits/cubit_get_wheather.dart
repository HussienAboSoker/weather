import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_sate_cubite.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/search_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  //
  GetWeatherCubit() : super(WeatherInitialState());

  //initialState
  //provid a weathermodel
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    weatherModel = await SearchService().getWeather(cityName: cityName);
    try {
      emit(WeatherLoadedSteate(weatherModel!));
    } catch (e) {
      emit(WeatherFaiureState());
    }
  }
}
