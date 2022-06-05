part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherDataEmpty extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherDataFetching extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherDataFetched extends WeatherState {
  final WeatherModel weatherData;

  @override
  List<Object> get props => [weatherData];

  const WeatherDataFetched({required this.weatherData});
}

