import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class rUready extends StatelessWidget {
  const rUready({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (context) => TimerModel(),
      child: Scaffold(
          body: Container(
        child: Column(
          children: [
            Text("Are you ready"),
            Consumer<TimerModel>(builder: (context, myModel, child) {
              return Text(myModel.countdown.toString());
            })
          ],
        ),
      )),
    );
  }
}

class TimerModel with ChangeNotifier {
  int countdown = 5;
  MyTimer() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
    });
  }
}
