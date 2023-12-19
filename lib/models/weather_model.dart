class WeatherModel {
  final String location;
  final String date;
  final double avgtemp;
  final double mintemp;
  final double maxtemp;
  final String textcodition;
  final String iconcondition;
  //// final Codition textcodition;
  // final Codition iconcondition;

  WeatherModel({
    required this.location,
    required this.date,
    required this.avgtemp,
    required this.mintemp,
    required this.maxtemp,
    required this.textcodition,
    required this.iconcondition,

    //  required this.iconcondition
  });
  factory WeatherModel.jason(jasonData) {
    return WeatherModel(
     // baseforecast = jasonData["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      location: jasonData["location"]["name"],
      date: jasonData["current"]["last_updated"],
      avgtemp: jasonData["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      mintemp: jasonData["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      maxtemp: jasonData["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      textcodition: jasonData["forecast"]["forecastday"][0]["day"]['condition']
          ["text"],
      iconcondition: jasonData["forecast"]["forecastday"][0]["day"]['condition']
          ["icon"],
      //  textcodition: Codition.jason(jasonData['condition']),
      //   iconcondition: iconcondition
    );
  }
}

class Codition {
  final String text;
  final String icon;

  Codition({required this.text, required this.icon});

  factory Codition.jason(jasondata) {
    return Codition(text: jasondata['text'], icon: jasondata["icon"]);
  }
}
