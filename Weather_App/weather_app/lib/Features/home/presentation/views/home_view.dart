import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Features/home/presentation/manager/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Features/home/presentation/manager/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/Features/home/presentation/views/widgets/no_weather_body.dart';
import 'package:weather_app/Features/home/presentation/views/widgets/weather_info_body.dart';
import 'package:weather_app/Features/search/presentation/views/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherInitialState) {
          return const NoWeatherBody();
        } else if (state is WeatherLoadedState) {
          return WeatherInfoBody(
            weatherModel: state.weatherModel,
          );
        } else {
          return const Text('Opps there was an error');
        }
      }),
    );
  }
}
