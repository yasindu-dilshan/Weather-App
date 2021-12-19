import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/bloc/weather_bloc.dart';
import 'package:mobile_app/widgets/reload_button_widget.dart';
import 'package:mobile_app/widgets/weather_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(),
      child: Scaffold(
        floatingActionButton: const ReloadButton(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black12,
                BlendMode.darken,
              ),
            ),
          ),
          child: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if(state is LoadedError){
                final _snackBar = SnackBar(
                  content: Text(
                    state.error,
                    style: const TextStyle(
                      color: Color(0xff099477),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  backgroundColor: const Color(0xffFF999D),
                );
                Scaffold.of(context).showSnackBar(_snackBar);
              }
            },
            builder: (context, state){
              if(state is Initial || state is Loading){
                return Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  height: (MediaQuery.of(context).size.height),
                  child: const Center(
                    child: CircularProgressIndicator(
                      key: Key('circularProgressIndicator'),
                      strokeWidth: 8,
                      backgroundColor: Color.fromARGB(0, 0, 0, 0),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff099477)),
                    ),
                  ),
                );
              }else if (state is Loaded){
                return WeatherWidget(weather: state.weatherModel);
              }else if (state is LoadedError){
                return WeatherWidget(weather: state.weatherModel);
              }else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
