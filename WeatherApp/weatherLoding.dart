import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Worker/worker.dart';

class WeatherLoading1 extends StatefulWidget {
  const WeatherLoading1({Key? key}) : super(key: key);

  @override
  State<WeatherLoading1> createState() => _WeatherLoading1State();
}

class _WeatherLoading1State extends State<WeatherLoading1> {
  // String Temperature = "Loading";
  String city = "Indore";
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  String? icon;
  void StartApp(String city) async {
//create object or instance of the worker class
    worker instance = worker(location: city);
    await instance.getData();
    print(instance.air_speed);
    print(instance.description);
    // setState(() {
    //   Temperature = instance.temp!;
    // });
    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value": icon,
        "city_value": city
      });
    });
    // Navigator.pushNamed(context, '/home');
    // Navigator.pushReplacementNamed(context, '/home', arguments: {
    //   "temp_value": temp,
    //   "hum_value": hum,
    //   "air_speed_value": air_speed,
    //   "des_value": des,
    //   "main_value": main
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    // print(instance.air_speed);
    // StartApp();
    super.initState();
    print("Mrityunjay");
  }

  @override
  Widget build(BuildContext context) {
    Map search1 = ModalRoute.of(context)?.settings.arguments as Map;
    if (search1.isEmpty ? false : true) {
      city = search1['searchText'];
    }
    StartApp(city);
    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "android/asset/images/we.jpg",
                height: 240,
                width: 240,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Mausam App",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Roboto ",
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text("Made By Mrityunjay",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Roboto Custom",
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
              SizedBox(
                height: 40,
              ),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ));
  }
}
