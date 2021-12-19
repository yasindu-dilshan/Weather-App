import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../util/Errors.dart';
import '../../util/util.dart';
import '../data/weather_data.dart';

class WeatherRepo {
  final _httpClient = http.Client();

  Future<Weather> getWeather() async {
    try {
      final response = await _httpClient.post(API_URL + "/getWeather");
      if (response.statusCode != 200) {
        throw ServrerError('CANNOT CONNECT TO THE SERVER!');
      } else {
        return _fromJsonList(json.decode(response.body));
      }
    } catch (e) {
      print(e);
      throw InternetConnectionError(e.toString());
    }
  }

  Weather _fromJsonList(Map<String, dynamic> jsonList) {
    return Weather(
      temperature: jsonList['temperature'],
      temperatureTimeStamp: jsonList['temperatureTimeStamp'],
      ambient: jsonList['ambient'],
      ambientTimeStamp: jsonList['ambientTimeStamp'],
      pressure: jsonList['pressure'],
      pressureTimeStamp: jsonList['pressureTimeStamp'],
      humidity: jsonList['humidity'],
      humidityTimeStamp: jsonList['humidityTimeStamp'],
    );
  }
}
