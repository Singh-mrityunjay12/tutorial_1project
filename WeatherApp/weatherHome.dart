// import 'dart:html';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_weather_icons/flutter_weather_icons.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:http/http.dart';
import 'package:flutter/src/widgets/routes.dart';
// import 'dart:ui';
import 'package:http/src/response.dart ';
import 'package:get/get.dart';
// import 'package:http/http.dart as http';
import 'package:http/http.dart' as http;
import 'package:weather_icons/weather_icons.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';

class WeatherHome1 extends StatefulWidget {
  const WeatherHome1({Key? key}) : super(key: key);

  @override
  State<WeatherHome1> createState() => _WeatherHome1State();
}

class _WeatherHome1State extends State<WeatherHome1> {
  TextEditingController searchController = new TextEditingController();
  // late String userName;

  // get http => null;
  //json-->json si similar to map  aur jab api data get karana hota h to data json
  //ke form me access karate h
  //
// Async -->isame Function Start But Return some delayed
//Future.delayed -->isame Function start after some delayed
//jaha bhi await function lag jata h vaha usake niche ke statment duration ka time complete hone ke bad hi run hoga

  // void getData() async {
  //   //is link per jo bhi data hoga vo Response type ka  data hota h
  //   // var s = Uri.https(authority, unencodedPath) "get/get_connect/http/src/response/response.dart";
  //   http.Response response;
  //   response = await get(Uri.parse(
  //       "https://api.openweathermap.org/data/2.5/weather?q=London&appid=539303f7ab7e810c5ee1c2b3d4d6df77"));

  //   Map data = jsonDecode(response.body);
  //   // Map temp_data = data['main'];
  //   // double temp = temp_data['temp'];
  //   List weather_data = data['weather'];
  //   Map weather_main_data = weather_data[0];
  //   print(weather_data);
  //   print(weather_main_data);
  //   print(weather_main_data['main']);
  // }

  /*
  getData() async {
    //some process access the data from database or Api
    await Future.delayed(Duration(seconds: 5), () {
      userName = "Mrityunjay Singh";
      // return null;
    });
    // print("$userName");
  }

  void showData() async {
    await getData();
    print("$userName");
  }
  */
  // void timer() {
  //   //process - 5 second
  //   Future.delayed(Duration(seconds: 9), () {
  //     print("ALARM IS RINGING");
  //   });
  //   print("You can do other step");
  // }

  // var counter = 0;
  //whole widget rebuild
  @override
  void initState() {
    super.initState();
    // timer();
    // getData();
    // showData();
    print("This is init State");
  }

//only rebuild Widget build
  // @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   super.setState(fn);
  //   print("SetState called");
  // }

  //Tell us widget destroyed
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widjet Destroyed");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Delhi", "Chennai", "Dhar", "Indore", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map info = {};
    info = ModalRoute.of(context)?.settings.arguments as Map;
    String temp = (info["temp_value"]).toString();
    String air = ((info['air_speed_value']).toString());
    if (temp == "NA") {
      print("NA");
    } else {
      temp = (info["temp_value"]).toString().substring(0, 4);
      air = ((info['air_speed_value']).toString()).substring(0, 4);
    }
    print(temp);
    String icon = info['icon_value'];
    print(icon);
    String getCity = info['city_value'];
    String hum = info['hum_value'];

    String des = info['des_value'];
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: PreferredSize(
        //     preferredSize: Size.fromHeight(0),
        //     child: GradientAppBar(
        //         gradient: LinearGradient(
        //             begin: Alignment.topCenter,
        //             end: Alignment.bottomCenter,
        //             colors: [Colors.pink, Colors.blue]))),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter,
                    // stops: [0.1, 0.3, 0.7],
                    colors: [Colors.blue, Colors.blueAccent])),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  //search vala container
                  // color: Colors.grey,
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                            child: Icon(Icons.search, color: Colors.blue)),
                        onTap: () {
                          // print(searchController.text);
                          if ((searchController.text).replaceAll(" ", "") ==
                              "") {
                            print("Blank search");
                          } else {
                            Navigator.pushReplacementNamed(context, "/loading",
                                arguments: {
                                  "searchText": searchController.text,
                                });
                          }
                        },
                      ),
                      Expanded(
                          child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "Search $city", border: InputBorder.none),
                      ))
                    ],
                  ),
                ),
                Row(children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(26),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    child: Row(
                      children: [
                        // Container(
                        //     height: 50,
                        //     width: 50,
                        //     decoration: BoxDecoration(

                        //         image: DecorationImage(
                        //             image: AssetImage(
                        //                 " https://openweathermap.org/img/wn/10d@2x.png")))),

                        // Image.network(
                        //     'https://openweathermap.org/img/wn/10d@2x.png'),
                        SizedBox(
                          width: 80,
                          height: 50,
                          child: Image.network(
                            'https://openweathermap.org/img/wn/$icon@2x.png',
                            width: 80,
                            height: 50,
                            //
                          ),
                        ),

                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "$des",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text("$getCity")
                          ],
                        )
                      ],
                    ),
                  ))
                ]),
                Row(children: [
                  Expanded(
                      child: Container(
                    height: 300,
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                    padding: EdgeInsets.all(26),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.thermometer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$temp",
                                style: TextStyle(fontSize: 50),
                              ),
                              Text(
                                "C",
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          )
                        ]),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                  ))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Container(
                      height: 200,
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_snow_wind),
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "$air",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text("km/hr")
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                    )),
                    Expanded(
                        child: Container(
                      height: 200,
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "$hum",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text("Percent")
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                    ))
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Made By Mrityunjay",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Data Provide By Openweathermap.org",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        ));
  }
}
