// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app/Data/data_provider/weather_data_provider.dart';
import 'package:weather_app/Model/weatherModel.dart';

class WeatherRepository {
  WeatherDataProvider weatherDataProvider;
  WeatherRepository(
    this.weatherDataProvider,
  );
  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final weather = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weather);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
