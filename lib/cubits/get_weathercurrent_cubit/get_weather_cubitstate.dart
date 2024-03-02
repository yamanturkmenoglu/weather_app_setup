import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

class InitialState extends WeatherState {}

class WeatherLodedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLodedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errmessage;

  WeatherFailureState(this.errmessage);
}
