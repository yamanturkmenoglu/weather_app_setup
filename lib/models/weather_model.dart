class WeatherModel {
  final String cityName;
  final double temp;
  final double mintemp;
  final double maxtemp;
  final String image;
  final String weatherCondition;
  final DateTime date;

  WeatherModel({
    required this.weatherCondition,
    required this.date,
    required this.cityName,
    required this.temp,
    required this.mintemp,
    required this.maxtemp,
    required this.image,
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      date: DateTime.parse(json['location']['localtime']),
      cityName: json['location']['name'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
