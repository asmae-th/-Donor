import 'package:blood_donation/comment.dart';
import 'package:blood_donation/dossier1/google_sheets_api.dart';
import 'package:blood_donation/lorout.dart';
import 'package:blood_donation/maps.dart';
import 'package:blood_donation/profile.dart';
import 'package:blood_donation/search.dart';
import 'package:blood_donation/video_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  // @overrideimport 'package:url_launcher/url_launcher.dart';
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeWidget(),
    ProfileWidget(),
    CommentWidget(),
    Maps(),
    Search(),
    Logout(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: homee(context),
    );
  }

  Widget homee(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.comment),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.search),
            label: 'Search',
          ),
         
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.exit_to_app),
            label: 'Log out',
          ),
        ],
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  Future<void> urLancher(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Donate your blood 🩸​, save lives 🫀​",
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
        ),
        
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 10,),
            VideoPlayer(),
            SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset("Images/o+.png", width: 170),
                    InkWell(
                      onTap: () {
                        urLancher("https://www.blood.co.uk/why-give-blood/blood-types/o-positive-blood-type/");
                      },
                      child:Text(
                        'More about O+',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Image.asset(
                      "Images/o-.png",
                      width: 170,
                    ),
                    InkWell(
                      onTap: () {
                        urLancher("https://www.blood.co.uk/why-give-blood/blood-types/o-negative-blood-type/");
                      },
                      child:Text(
                        'More about O-',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset("Images/A+.png", width: 170),
                    InkWell(
                      onTap: () {
                        urLancher("https://www.blood.co.uk/why-give-blood/blood-types/a-positive-blood-type/");
                      },
                      child:Text(
                        'More about A+',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Image.asset(
                      "Images/A-.png",
                      width: 170,
                    ),
                    InkWell(
                      onTap: () {
                        urLancher("https://www.blood.co.uk/why-give-blood/blood-types/a-negative-blood-type/");
                      },
                      child:Text(
                        'More about A-',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset("Images/B+.png", width: 170),
                    InkWell(
                      onTap: () {
                        urLancher("https://www.blood.co.uk/why-give-blood/blood-types/b-positive-blood-type/");
                      },
                      child:Text(
                        'More about B+',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Image.asset(
                      "Images/B-.png",
                      width: 170,
                    ),
                    InkWell(
                      onTap: () {
                        urLancher("https://www.blood.co.uk/why-give-blood/blood-types/b-negative-blood-type/");
                      },
                      child:Text(
                        'More about B-',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset("Images/AB+.png", width: 170),
                    InkWell(
                      onTap: () {
                        urLancher("https://www.blood.co.uk/why-give-blood/blood-types/ab-positive-blood-type/");
                      },
                      child:Text(
                        'More about AB+',
                        style: TextStyle(
                        fontSize: 15,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Image.asset(
                      "Images/AB-.png",
                      width: 170,
                    ),
                    InkWell(
                      onTap: () {
                        urLancher("https://www.blood.co.uk/why-give-blood/blood-types/ab-negative-blood-type/");
                      },
                      child:Text(
                        'More about AB-',
                        style: TextStyle(
                        fontSize: 15,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(
                children: [
                  Image.asset(
                      "Images/Rare.png",
                      width: 170,
                    ),
                    InkWell(
                      onTap: () {
                        urLancher("https://www.blood.co.uk/why-give-blood/demand-for-different-blood-types/rare-blood-types/");
                      },
                      child:Text(
                        'More about rare blood type',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                       ),
                    )
                ],
              )
        
            ],),
            
        
          ],
        ),
      ),
    );
  }
}

// class ProfileWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Page Profil'),
//     );
//   }
// }

class LocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page Localisation'),
    );
  }
}

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page Recherche'),
    );
  }
}

// class logout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Page Recherche'),
//     );
//   }
// }
