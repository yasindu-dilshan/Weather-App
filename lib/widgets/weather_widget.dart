import 'package:flutter/material.dart';
import 'package:mobile_app/data/weather_data.dart';
import 'package:mobile_app/widgets/weather_value_widget.dart';

class WeatherWidget extends StatelessWidget {

  final Weather weather;

  const WeatherWidget({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Weather Values',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w900,
                color: Colors.tealAccent,
              ),
            ),
          ),
          const SizedBox(height: 24),
          WeatherValue(
            type: 'Temperature',
            value: weather.temperature,
            timeStamp: weather.temperatureTimeStamp,
          ),
          const SizedBox(height: 24),
          WeatherValue(
            type: 'Pressure',
            value: weather.pressure,
            timeStamp: weather.pressureTimeStamp,
          ),
          const SizedBox(height: 24),
          WeatherValue(
            type: weather.humidity,
            value: "12",
            timeStamp: weather.humidityTimeStamp,
          ),
          const SizedBox(height: 24),
          WeatherValue(
            type: 'Ambient',
            value: weather.ambient,
            timeStamp: weather.ambientTimeStamp,
          ),
        ],
      ),
    );
  }
}
