import 'package:flutter/material.dart';

class BloodType extends StatefulWidget {
  @override
  _BloodTypeState createState() => _BloodTypeState();
}

class _BloodTypeState extends State<BloodType> {
  String? selectedValue;
  final List<String> bloodgroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-'];

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                child: DropdownButtonFormField<String>(
                  
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.red),
                     borderRadius: BorderRadius.circular(12)
                     ),
                     contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                filled: true,
                fillColor: Colors.grey[300],
                  ),
                  value: selectedValue,
                  hint: Text(
                    'Blood Group',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  
                  items: bloodgroups.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue;
                      print(selectedValue);
                      // user.blood = selectedValue;
                    });
                  },
                ),
              ),
            ],
          ),

    );
  }
}