import 'dart:async';

import 'package:blood_donation/dossier1/blood_type.dart';
import 'package:blood_donation/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String? selectedValue;
  final List<String> bloodgroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-'];
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    _confirmpassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //try creaton the user
  // try {
  //   //create the user
  //   UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: _emailController.text, password: _passwordController.text,
  //     );
  // }

  Future singUp() async {
    if (passwordconfirmed()) {
      //create the user
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
      //after creation the user, creat a new document in cloud firebase called users
      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
            'first name' : firstname.text,
            'last name'  : lastname.text,
            'city' : _city.text,
            'phone' : _phone.text,
            'blood type': selectedValue,
          }
          );

      //add user details
      addUserDetails(firstname.text.trim(), lastname.text.trim(),
          _emailController.text.trim());
      //int.parse(text here)
      Navigator.of(context).pushReplacementNamed("/home");
    }
  }

  Future addUserDetails(String firstname, String lastname, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstname,
      'last name': lastname,
      'email': email,
    });
  }

  bool passwordconfirmed() {
    if (_passwordController.text.trim() == _confirmpassword.text.trim()) {
      return (true);
    } else {
      return (false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            "Create Account",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body:
      SingleChildScrollView(

        child: Column(
        children: [
          Image.asset("Images/regiter.png",height: 150,width: 300,),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: firstname,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12)),
                hintText: "First Name",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: lastname,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12)),
                hintText: "Last name",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12)),
                hintText: "Email",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),
          ),
            SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: _city,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12)),
                hintText: "City",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),
          ),
            SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: _phone,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12)),
                hintText: "Phone",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          //bloood type 

           Padding(
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
    ),
          // SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12)),
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: _confirmpassword,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12)),
                hintText: "Confirm Password",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: singUp,
                // () async {
                //   try {
                //     final credential = await FirebaseAuth.instance
                //         .createUserWithEmailAndPassword(
                //       email: email.text,
                //       password: password.text,
                //     );
                //     Navigator.of(context).pushReplacementNamed("/home");
                //   } on FirebaseAuthException catch (e) {
                //     if (e.code == 'weak-password') {
                //       print('The password provided is too weak.');
                //     } else if (e.code == 'email-already-in-use') {
                //       print('The account already exists for that email.');
                //     }
                //   } catch (e) {
                //     print(e);
                //   }
                // },
                child: Text(
                  "Finish",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
           SizedBox(
            height: 20,
          ),
          //logineButton("Finish", context, "/login"),
        ],
      ),
      )
    );
  }
}
// Widget acount(BuildContext context) {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Create Account'),
//     ),
//     body: Column(
//       children: [
//          Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: TextFormField(
//             controller: _emailController,
//             decoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.red),
//                 borderRadius: BorderRadius.circular(12)
//               ),
//               hintText: "Enter your email",
//               hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
//               contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//               filled: true,
//               fillColor: Colors.grey[300],
//             ),
//           ),
//           ),
//         SizedBox(
//           height: 20,
//         ),
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: TextFormField(
//             controller: _emailController,
//             decoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.red),
//                 borderRadius: BorderRadius.circular(12)
//               ),
//               hintText: "Enter your email",
//               hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
//               contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//               filled: true,
//               fillColor: Colors.grey[300],
//             ),
//           ),
//           ),
//         SizedBox(
//           height: 20,
//         ),
//          Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: TextFormField(
//             controller: _emailController,
//             decoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.red),
//                 borderRadius: BorderRadius.circular(12)
//               ),
//               hintText: "Enter your email",
//               hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
//               contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//               filled: true,
//               fillColor: Colors.grey[300],
//             ),
//           ),
//           ),
//         SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Container(
//             height: 60,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 color: Colors.red, borderRadius: BorderRadius.circular(20)),
//             child: TextButton(
//               onPressed: () async {
//                 try {
//                   final credential = await FirebaseAuth.instance
//                       .createUserWithEmailAndPassword(
//                     email: email.text,
//                     password: password.text,
//                   );
//                   Navigator.of(context).pushReplacementNamed("/home");
//                 } on FirebaseAuthException catch (e) {
//                   if (e.code == 'weak-password') {
//                     print('The password provided is too weak.');
//                   } else if (e.code == 'email-already-in-use') {
//                     print('The account already exists for that email.');
//                   }
//                 } catch (e) {
//                   print(e);
//                 }
//               },
//               child: Text(
//                 "Finish",
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ),
//         )
//         //logineButton("Finish", context, "/login"),
//       ],
//     ),
//   );
//}
// class _AccountState extends State<Account> {
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _passwordController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _createAccount() {
//     // Implémentez ici la logique de création de compte
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Account'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _createAccount,
//                 child: Text('Create Account'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
