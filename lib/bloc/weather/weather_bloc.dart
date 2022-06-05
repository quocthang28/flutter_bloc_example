import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherDataEmpty()) {
    on<WeatherButtonPressed>((event, emit) async {
      emit(WeatherDataFetching());
      await _getWeatherData(event.cityName)
          .then((value) => emit(WeatherDataFetched(weatherData: value)));
    });
  }

  Future<WeatherModel> _getWeatherData(String cityName) async {
    return await Future.delayed(const Duration(seconds: 1),
            () => WeatherModel(cityName: cityName, temp: 30));
  }
}
