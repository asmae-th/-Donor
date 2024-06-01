import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPwPage extends StatefulWidget {
  const ForgotPwPage({super.key});

  @override
  State<ForgotPwPage> createState() => _ForgotPwPageState();
}

class _ForgotPwPageState extends State<ForgotPwPage> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link sent ! Check your Email"),
            );
          });
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            "Reset Password",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter your email and we will send you a password rest link",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12)),
                hintText: "Enter your email",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),
          ),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: passwordReset,
            child: Text(
              "Rest Password",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
