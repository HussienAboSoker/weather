import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/cubit_get_wheather.dart';
import 'package:weather/models/weather_model.dart';

class CurrentWheather extends StatelessWidget {
  const CurrentWheather({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //city
        Text(
          weatherModel.location,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 30,
        ),
        //upload
        Text(
          weatherModel.date,
        ),
        const SizedBox(
          height: 30,
        ),
        //image 17  [max temp 17
        //           min  temp 13   ]
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              weatherModel.iconcondition,
              height: 100,
              width: 100,
            ),
            Text("${weatherModel.avgtemp}"),
            Column(
              children: [
                Text("${weatherModel.maxtemp}"),
                Text("${weatherModel.mintemp}"),
              ],
            ),
            //stutus
          ],
        ),
        const SizedBox(
          height: 70,
        ),
        Text(
          weatherModel.textcodition,
          //  style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
