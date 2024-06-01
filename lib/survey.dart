import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:blood_donation/login.dart';

class Survey extends StatefulWidget {
  const Survey({super.key});

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Container(
              child: Icon(
                Icons.bloodtype,
                size: 200,
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Please pick your \n     blood type",
          style: TextStyle(fontSize: 40),
        ),
        SizedBox(
          height: 30,
        ),
        bloodtype("A", "B"),
         SizedBox(
          height: 10,
        ),
        
        SizedBox(
          height: 10,
        ),
        bloodtype("O", "AB"),
         SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                 color: Colors.grey[350],
                 borderRadius: BorderRadius.circular(8),
              ),
              width: 60,
              height: 60,
              child: Center(child: Icon(Icons.add)),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                 color: Colors.grey[350],
                 borderRadius: BorderRadius.circular(8),
              ),
              height: 60,
              width: 60,
              child: Center(child: Icon(Icons.remove)),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
       // logineButton("Finish"),

      ],
    );
  }
}

Widget bloodtype(String type1, String type2) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Container(
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(30)),
      width: 180,
      height: 90,
      child: Center(child: Text(
        type1,
        style: TextStyle(fontSize: 20),
        ),
        )
    ),
    SizedBox(
      width: 20,
    ),
    Container(
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(20)),
      width: 180,
      height: 90,
    child: Center(child: Text(
      type2,
      style: TextStyle(fontSize: 20),
      ),
      )
    )
  ]);
}
