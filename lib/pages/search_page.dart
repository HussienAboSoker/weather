import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/cubit_get_wheather.dart';
import 'package:weather/widgets/customtextfiled.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  // TextEditingController textcontrollerT = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City "),
      ),
      body: Column(children: [
        const SizedBox(
          height: 40,
        ),
        CustomTextFiled(
          //  textEditingController: textcontrollerT,
          onSubmitted: (cityName) async {
            GetWeatherCubit getWeatherCubit =
                BlocProvider.of<GetWeatherCubit>(context);
            await getWeatherCubit.getWeather(cityName: cityName);

            Navigator.pop(context);
          },
          hintText: 'CityName',
        ),
      ]),
    );
  }
}
