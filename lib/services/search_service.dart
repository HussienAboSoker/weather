

import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:weather/models/weather_model.dart';

class SearchService {
  Future<WeatherModel> getWeather({required String cityName}) async {
     String baseurl = 'http://api.weatherapi.com/v1';
     String key = 'e30d28c544c74872b25135153232505';
      final dio = Dio();
    try {
     
      Response response = await dio.get(
        '$baseurl/forecast.json?key=$key&q=$cityName&days=1',
      );
      WeatherModel weatherdata=WeatherModel.jason(response.data);
      return weatherdata;
      

      
    } on DioException catch (e) {
     String errMessage =e.response?.data['error']['message'];
     throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oop try later");
    }
  }
}
