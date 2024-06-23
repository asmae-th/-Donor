import 'package:blood_donation/account.dart';
import 'package:blood_donation/home.dart';
import 'package:blood_donation/splash.dart';
import 'package:blood_donation/splash_a.dart';
import 'package:blood_donation/survey.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:blood_donation/login.dart';

void main()  async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
} 

class _MyAppState extends State<MyApp> {

    @override
  void initState() {
    FirebaseAuth.instance
  .idTokenChanges()
  .listen((User? user) {
    if (user == null) {
      print('===================User is currently signed out!');
    } else {
      print('===========User is signed in!');
    }
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : FirebaseAuth.instance.currentUser == null ? Splash() : Home(),
      routes: {
         '/splash_a': (context) => SplashA(),
        
        '/login': (context) => Login(),
        // '/booking':(context) => Booking(),
        '/survey': (context) => Survey(),
        '/account': (context) => Account(),
        '/home': (context) => Home(),
      },
    );
  }
}
