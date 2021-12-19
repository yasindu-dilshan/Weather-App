import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/bloc/weather_bloc.dart';

class ReloadButton extends StatelessWidget {
  const ReloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          BlocProvider.of<WeatherBloc>(context).add(GetWeatherEvent());
        },
      icon: const Icon(
        Icons.replay_outlined,
        color: Colors.white,
      ),
      label: const Text(
        'Refresh',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
