class Weather {
  final String temperature;
  final String temperatureTimeStamp;
  final String ambient;
  final String ambientTimeStamp;
  final String pressure;
  final String pressureTimeStamp;
  final String humidity;
  final String humidityTimeStamp;

  Weather({
    required this.temperature,
    required this.temperatureTimeStamp,
    required this.ambient,
    required this.ambientTimeStamp,
    required this.pressure,
    required this.pressureTimeStamp,
    required this.humidity,
    required this.humidityTimeStamp
  });

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'temperatureTimeStamp': temperatureTimeStamp,
      'ambient': ambient,
      'ambientTimeStamp': ambientTimeStamp,
      'pressure': pressure,
      'pressureTimeStamp': pressureTimeStamp,
      'humidity': humidity,
      'humidityTimeStamp': humidityTimeStamp
    };
  }

  static Weather fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['temperature'],
      ambient: json['ambient'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      temperatureTimeStamp: json['temperatureTimeStamp'],
      ambientTimeStamp: json['ambientTimeStamp'],
      pressureTimeStamp: json['pressureTimeStamp'],
      humidityTimeStamp: json['humidityTimeStamp'],
    );
  }

}