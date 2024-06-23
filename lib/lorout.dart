import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Text(
              "Log out",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
      ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("Images/blood.png"),
            Text("Are you sure you want to logOut ?",
            style: TextStyle
            (color: Colors.red, fontSize: 20),
        
        ),
        
            TextButton(
              
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed("login");
                },
                 child: Text("  LogOut  🫡 ​  ",style: TextStyle(backgroundColor: Colors.red, color: Colors.white,fontSize: 20),),
                // icon: Icon(Icons.exit_to_app),color: Colors.red,iconSize: 50,
                )
        
          ]),
      ),
    );
  }
}