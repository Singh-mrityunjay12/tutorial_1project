// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_api_1/WeatherApp/weatherArUready.dart';

class Startup extends StatefulWidget {
  const Startup({Key? key}) : super(key: key);

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => rUready()));
          Navigator.pushNamed(context, "/home2");
        },
        child: Text(
          "START",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: CustomScrollView(),
    );
  }
}
