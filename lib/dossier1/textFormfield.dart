import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  const CustomTextForm(String s, TextEditingController email, { required this.hinttext, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}
