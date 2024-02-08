import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/Features/home/presentation/manager/get_weather_cubit/get_weather_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: TextField(
          onSubmitted: (value) async {
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cityName: value);
            Navigator.of(context).pop();
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            labelText: 'Search',
            suffixIcon: Icon(Icons.search),
            hintText: 'Enter city name',
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          ),
        ),
      ),
    );
  }
}
