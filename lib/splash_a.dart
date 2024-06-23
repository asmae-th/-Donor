import 'package:flutter/material.dart';

class SplashA extends StatefulWidget {
  const SplashA({super.key});

  @override
  State<SplashA> createState() => _SplashAState();
}

class _SplashAState extends State<SplashA> {
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
              Image.asset("Images/s3.png",fit: BoxFit.cover,),
              SizedBox(
                height: 90,
              ),
              Text(

                "Your donated blood can save a life \n    and that life can save another \n         be part of the chain 😉",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              SizedBox(
                height: 90,
              ),
              Container(
                color: Colors.red,
                height: 70,
                width: 3000,
                child: TextButton(
                
                  onPressed: route,
                  child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 35),)
                  ),
              )
            ],
          )),
    ));
  }
}