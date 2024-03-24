import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/cubit_get_wheather.dart';
import 'package:weather/cubits/weather_sate_cubite.dart';

import 'package:weather/pages/home/home_page.dart';
import 'package:weather/pages/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /**
     * BlocProvider is a widget provided by the bloc package,
     *  and it is used to provide a bloc (business logic component) to the widget tree.

The create parameter of BlocProvider is used to instantiate and provide the GetWeatherCubit.
 In this case, you're using an anonymous function to create a new instance of GetWeatherCubit.
     */
    return BlocProvider(
      //provide object of Getweathercubit() for all app
      create: (context) => GetWeatherCubit(),
      //Builder widget get a new cotext for widget
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => const HomePage(),
                '/search': (context) => const SearchPage(),
              },
              title: 'Wheather',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: getcolor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.textcodition,
                ),
                // textTheme: const TextTheme(
                //   bodyLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                //   bodyMedium: TextStyle(
                //     fontSize: 20,
                //   ),
                //   bodySmall: TextStyle(
                //     fontSize: 10,
                //   ),
                // ),
                // appBarTheme: const AppBarTheme(
                //   //  color: Colors.lightBlue,
                //   centerTitle: true,
                //   titleTextStyle: TextStyle(
                //     color: Colors.black,
                //   ),
                // ),
              ),
              //  home: const SearchPage(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor? getcolor(String? codition) {
  if (codition == null) {
    return Colors.red;
  } else {
    switch (codition.toLowerCase()) {
      case 'sunny':
      case 'clear':
        return Colors.red;
      case 'partly cloudy':
        return Colors.orange;
      case 'cloudy':
        return Colors.blueGrey;
      case 'overcast':
        return Colors.grey;
      case 'mist':
        return Colors.pink;
      case 'patchy rain possible':
        return Colors.pink;
      case 'patchy snow possible':
        return Colors.lightBlue;
      case 'patchy sleet possible':
        return Colors.green;
      case 'patchy freezing drizzle possible':
        return Colors.green;
      case 'thundery outbreaks possible':
        return Colors.green;
      case 'blowing snow':
        return Colors.amber;
      case 'blizzard':
        return Colors.green;
      case 'fog':
        return Colors.grey;
      case 'freezing fog':
        return Colors.green;
      case 'patchy light drizzle':
        return Colors.green;
      case 'light drizzle':
        return Colors.green;
      case 'freezing drizzle':
        return Colors.green;
      case 'heavy freezing drizzle':
        return Colors.green;
      case 'patchy light rain':
        return Colors.green;
      case 'light rain':
        return Colors.green;
      case 'moderate rain at times':
        return Colors.green;
      case 'moderate rain':
        return Colors.green;
      case 'heavy rain at times':
        return Colors.green;
      case 'heavy rain':
        return Colors.purple;
      case 'light freezing rain':
        return Colors.amber;
      case 'moderate or heavy freezing rain':
        return Colors.purple;
      case 'light sleet':
        return Colors.purple;
      case 'moderate or heavy sleet':
        return Colors.purple;
      case 'patchy light snow':
        return Colors.purple;
      case 'light snow':
        return Colors.purple;
      case 'patchy moderate snow':
        return Colors.purple;
      case 'moderate snow':
        return Colors.purple;
      case 'patchy heavy snow':
        return Colors.purple;
      case 'heavy snow':
        return Colors.purple;
      case 'ice pellets':
        return Colors.purple;
      case 'light rain shower':
        return Colors.purple;
      case 'moderate or heavy rain shower':
        return Colors.purple;
      case 'torrential rain shower':
        return Colors.purple;
      case 'light sleet showers':
        return Colors.purple;
      case 'moderate or heavy sleet showers':
        return Colors.yellow;
      case 'light snow showers':
        return Colors.pink;
      case 'moderate or heavy snow showers':
        return Colors.purple;
      case 'light showers of ice pellets':
        return Colors.indigo;
      case 'moderate or heavy showers of ice pellets':
        return Colors.grey;
      case 'patchy light rain with thunder':
        return Colors.amber;
      case 'moderate or heavy rain with thunder':
        return Colors.deepOrange;
      case 'patchy light snow with thunder':
        return Colors.brown;
      case 'moderate or heavy snow with thunder':
        return Colors.green;
      default:
        return null;
    }
  }
}
