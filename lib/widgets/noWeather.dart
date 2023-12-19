import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
     //  Image.asset("assets/noweather.png",height: 30,width: 30,),
        Text("there is no wheather"),
        SizedBox(
          height: 40,
        ),
        Center(child: Text("please search for weather by cityname")),

      ],
    );
  }
}
