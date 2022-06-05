import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/weather/weather_bloc.dart';
import 'package:velocity_x/velocity_x.dart';


class Screen1Bloc extends StatelessWidget {
  const Screen1Bloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => WeatherBloc(), child: Screen1());
  }
}



class Screen1 extends StatelessWidget {
  Screen1({Key? key}) : super(key: key);

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              //print(state.toString());
              if (state is WeatherDataEmpty) {
                return const Text("type city name in text field");
              } else if (state is WeatherDataFetching) {
                return const CircularProgressIndicator();
              } else if (state is WeatherDataFetched) {
                return Column(
                  children: [
                    Text(state.weatherData.cityName!),
                    Text(state.weatherData.temp!.toString()),
                  ],
                );
              } else {
                return 0.heightBox;
              }
            },
          ),
          TextField(controller: _textEditingController),
          TextButton(
              onPressed: () => context
                  .read<WeatherBloc>()
                  .add(WeatherButtonPressed(cityName: _textEditingController.text)),
              child: const Text("search")),
        ],
      ),
    );
  }
}
