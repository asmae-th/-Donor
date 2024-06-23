import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

class Coment extends StatelessWidget {
  final String text;
  final String user;
  final String time;
  const Coment({super.key, required this.text, required this.user, required this.time});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        
        decoration: BoxDecoration(color: Colors.red[200],
        border: Border(top: BorderSide(width: 2))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //user , time 
          Row(
            children: [
              Text(user,style: TextStyle(color: Colors.grey[600]),),
              Text(" : "),
              Text(time,style: TextStyle(color: Colors.grey[600]),),
            ],
          ),
          
          SizedBox(height: 5,),
          //Comment
          Text(text,style: TextStyle(color: Colors.black,fontSize: 15),),
          SizedBox(height: 5,),
          
        ],),
      ),
    );
  }
}
