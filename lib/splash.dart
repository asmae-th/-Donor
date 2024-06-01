import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    stateTimer();
    super.initState();
  }

  stateTimer() {
    var duration = Duration(seconds: 1);
    return Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("Images/bloodhero.png"),
              SizedBox(
                height: 10,
              ),
              Text(

                "Welcome hero 😉",
                style: TextStyle(fontSize: 35, color: Colors.red),
              ),
            ],
          )),
    ));
  }
}
