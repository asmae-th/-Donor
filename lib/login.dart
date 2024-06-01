// // import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: content(context),
//     );
//   }

//   Widget content(BuildContext context) {
//      TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(40),
//                     bottomRight: Radius.circular(40))),
//             height: 400,
//             width: double.infinity,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 20.0),
//               child: Image.asset("Images/main.png"),
//             ),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Column(
//             children: [
//               Text("Email", style: TextStyle(fontSize: 20,color: Colors.black)),
//               TextFormField(
//           controller: email,
//           decoration: InputDecoration(
//             hintText: "Enter your email",
//             hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
//             contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//             filled: true,
//             fillColor: Colors.grey[300],
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Text("Password", style: TextStyle(fontSize: 20,color: Colors.black)),
//         TextFormField(
//           controller: password,
//           decoration: InputDecoration(
//             hintText: "Enter your password​",
//             hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
//             contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//             filled: true,
//             fillColor: Colors.grey[300],
//           ),
//         ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text("Forgot Password ​👊​?",style: TextStyle(fontSize: 15,color: Colors.red),),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           //logineButton("Login",context,"/home",email,password),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Container(
//             height: 60,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 color: Colors.red, borderRadius: BorderRadius.circular(20)),
//             child: TextButton(
//               onPressed: () async {
//                                   try {
//                     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//                       email: email.text,
//                       password: password.text,
//                     );
//                 Navigator.of(context).pushReplacementNamed("/home");
//                   } on FirebaseAuthException catch (e) {
//                     if (e.code == 'user-not-found') {
//                       print('No user found for that email.');
//                       // AwesomeDialog(
//                       // context: context,
//                       // dialogType: DialogType.error,
//                       // animType: AnimType.rightSlide,
//                       // title: 'Error',
//                       // desc: 'No user found for that email.',
//                       // ).show();
//                     } else if (e.code == 'wrong-password') {
//                       print('Wrong password provided for that user.');
//                       // AwesomeDialog(
//                       // context: context,
//                       // dialogType: DialogType.error,
//                       // animType: AnimType.rightSlide,
//                       // title: 'Error',
//                       // desc: 'Wrong password provided for that user.',
//                       // ).show();
//                     }
//                   }
//               },
//               child: Text(
//                 "Login",
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//             height: 10,
//           ),
//           logineButton("Create Account",context,"/account",(){},),

//           // Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//           //   child: Align(
//           //     alignment: Alignment.topLeft,
//           //     child: Row(
//           //       children: [
//           //         Text("Learn More",
//           //             style: TextStyle(
//           //               fontSize: 15,
//           //               color: Colors.redAccent,
//           //             )),
//           //         Spacer(),
//           //         GestureDetector(
//           //           onTap: () {
//           //             Navigator.of(context).pushNamed("/survey");
//           //           },
//           //           child: Text(
//           //             "Skip now -> ",
//           //             style: TextStyle(fontSize: 15, color: Colors.redAccent),
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// Widget logineButton(String title,BuildContext context,String name,VoidCallback onPressed()) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: Container(
//       height: 60,
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Colors.red, borderRadius: BorderRadius.circular(20)),
//       child: TextButton(
//         onPressed: (){},
//         child: Text(
//           title,
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//       ),
//     ),
//   );
// }

import 'package:blood_donation/dossier1/forgot_pw_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Container avec l'image
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            height: 400,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset("Images/main.png"),
            ),
          ),
          SizedBox(height: 40),
          // Champs de saisie de l'email
          Column(
            children: [
              Text("Email",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12)
              ),
              hintText: "Enter your email",
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
          ),
              //SizedBox(height: 20),
              // Champs de saisie du mot de passe
              Text("Password",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            // SizedBox(height: 20),
             Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12)
              ),
              hintText: "Enter your Password",
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
          ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ForgotPwPage();
                            },
                          ),
                        );
                      },
                      child: Text("Forgot Password ?",
                          style: TextStyle(fontSize: 15, color: Colors.red)),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          // Bouton de connexion
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    // Rediriger vers la page d'accueil
                    Navigator.of(context).pushReplacementNamed("/home");
                  } on FirebaseAuthException catch (e) {
                    // Gérer les erreurs de connexion
                    if (e.code == 'user-not-found') {
                      showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("user-not-found"),
                        );
                      });
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                       showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(e.message.toString()),
                        );
                      });
                    }
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Bouton de création de compte
          logineButton("Create Account", context, "/account", () {}),
        ],
      ),
    );
  }
}

Widget logineButton(
    String title, BuildContext context, String name, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () {
          // Naviguer vers la page de création de compte
          Navigator.of(context).pushNamed(name);
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    ),
  );
}
