import 'package:blood_donation/account.dart';
import 'package:blood_donation/home.dart';
import 'package:blood_donation/splash.dart';
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
      home : FirebaseAuth.instance.currentUser == null ? Login() : Home(),
      routes: {
        //'/': (context) => Splash(),
        
        '/login': (context) => Login(),
        // '/booking':(context) => Booking(),
        '/survey': (context) => Survey(),
        '/account': (context) => Account(),
        '/home': (context) => Home(),
      },
    );
  }
}
  // http: ^1.2.1
  // provider: ^6.1.2
  // hive: ^2.2.3
  // hive_flutter: ^1.1.0
  // flutter_svg: ^2.0.10+1
  // cloud_firestore: ^4.17.4
  // cached_network_image: ^3.3.1
  // awesome_dialog: ^3.2.1
  // fluttertoast: ^8.0.8
  // flutter_font_icons: ^2.2.7
  // url_launcher: ^6.2.6
  // firebase_storage: ^11.7.6
  // image_picker: ^1.1.1
  // share: ^2.0.4
  // dots_indicator: ^3.0.0