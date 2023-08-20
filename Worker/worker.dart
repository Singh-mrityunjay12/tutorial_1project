import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// class - different, method
//instance - different data
class worker {
  String? location;
  //Constructor
  worker({this.location}) {
    location = this.location;
  }

  //properties
  // String? location;
  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;
  Future<void> getData() async {
    //is link per jo bhi data hoga vo Response type ka  data hota h
    // var s = Uri.https(authority, unencodedPath) "get/get_connect/http/src/response/response.dart";
    try {
      http.Response response;
      response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=539303f7ab7e810c5ee1c2b3d4d6df77"));

      Map data = jsonDecode(response.body);

      //Getting Temp,Humidity

      Map temp_data = data['main'];
      String getHumidity = temp_data["humidity"].toString();
      double getTemp = temp_data['temp'] - 273.15;

      //Getting air_speed
      Map wind = data['wind'];
      double getAir_speed = wind["speed"] / 0.2777777777778;

      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];
      String icon_value = weather_main_data["icon"].toString();

      // print(weather_data);
      // print(weather_main_data);
      // print(weather_main_data['main']);

      //Assigning Values
      temp = getTemp.toString(); //C
      humidity = getHumidity; // %
      air_speed = getAir_speed.toString(); // Km/hr
      description = getDesc;
      main = getMain_des;
      icon = icon_value;
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "NA";
      main = "NA";
      icon = "09d";
    }
  }
}
