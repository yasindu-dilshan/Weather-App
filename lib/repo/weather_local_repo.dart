import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_app/util/Errors.dart';
import '../../util/util.dart';

import '../data/weather_data.dart';

class WeatherLocalRepo {
  static Future<void> setWeather(Weather weatherModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
      WEATHER_KEY,
      json.encode(
        weatherModel.toJson(),
      ),
    );
  }

  static Future<Weather> getWeatherModel() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String weatherModelString =
        sharedPreferences.getString(WEATHER_KEY);
    if (weatherModelString != null) {
      Map<String, dynamic> _weatherModelJson = json.decode(weatherModelString);
      return Weather.fromJson(_weatherModelJson);
      
    } else {
      throw CacheError('Error in the local cache');
    }
  }
}
