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
   // stateTimer();
    super.initState();
  }

  // stateTimer() {
  //   var duration = Duration(seconds: 1);
  //   return Timer(duration, route);
  // }

  route() {
    Navigator.of(context).pushReplacementNamed('/splash_a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 120, 171, 190),
        body: Center(
          
      child: Container(
        
          color: Colors.transparent,
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SizedBox(
                height: 200,
              ),
              Image.asset("Images/s5.png",fit: BoxFit.cover,),
              SizedBox(
                height: 10,
              ),
              // Text(

              //   "Welcome hero 😉",
              //   style: TextStyle(fontSize: 35, color: Colors.red),
              // ),
               SizedBox(
                height: 200,
              ),
                Container(
                color: Colors.red,
                height: 70,
                width: 3000,
                child: TextButton(
                
                  onPressed: route,
                  child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 35),)
                  ),
                  
              ),
               SizedBox(
                height: 100,
              ),
            ],
          )),
    ));
  }
}
