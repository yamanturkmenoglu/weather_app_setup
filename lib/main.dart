import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weathercurrent_cubit/get_weather_cubitstate.dart';
import 'package:weather_app/cubits/get_weathercurrent_cubit/getweathercubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
MaterialColor getThemeColor(String? Condition) {
  if (Condition == 'Sunny' ||
      Condition == 'Clear' ||
      Condition == 'partly cloudy') {
    return Colors.orange;
  } else if (Condition == 'Blizzard' ||
      Condition == 'Patchy snow possible' ||
      Condition == 'Patchy sleet possible' ||
      Condition == 'Patchy freezing drizzle possible' ||
      Condition == 'Blowing snow') {
    return Colors.blue;
  } else if (Condition == 'Freezing fog' ||
      Condition == 'Fog' ||
      Condition == 'Heavy Cloud' ||
      Condition == 'Mist' ||
      Condition == 'Fog') {
    return Colors.blueGrey;
  } else if (Condition == 'Patchy rain possible' ||
      Condition == 'Heavy Rain' ||
      Condition == 'Showers	') {
    return Colors.blue;
  } else if (Condition == 'Thundery outbreaks possible' ||
      Condition == 'Moderate or heavy snow with thunder' ||
      Condition == 'Patchy light snow with thunder' ||
      Condition == 'Moderate or heavy rain with thunder' ||
      Condition == 'Patchy light rain with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.blue;
  }
}
