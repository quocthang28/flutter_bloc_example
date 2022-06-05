part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class WeatherButtonPressed extends WeatherEvent {
  final String cityName;

  const WeatherButtonPressed({required this.cityName});
}
