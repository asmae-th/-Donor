import 'dart:ffi';
// import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:blood_donation/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({super.key});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;
  //text controller
  final textcontroller = TextEditingController();

//post message
  void postMessage() {
    //only post if there is something in the textfield
    if (textcontroller.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('User Posts').add({
        'UserEmail': currentUser.email,
        'Message': textcontroller.text,
        'TimeStamp': Timestamp.now(),
        'Likes' : [],
      });
    }

    //clear the textfield
    setState(() {
      textcontroller.clear();
    });
    return null;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Request",style: TextStyle(color: Colors.white),),centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            //the wall
            Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("User Posts")
                        .orderBy("TimeStamp", descending: false)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              //get the message
                              final post = snapshot.data!.docs[index];
                              return Post(
                                message: post['Message'],
                                User: post['UserEmail'],
                                postId: post.id,
                                likes: List<String>.from(post['Likes'] ?? []) ,
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Error : " + snapshot.error.toString()),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    })),
            //post message
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  //textfield
                  Expanded(
                    child: TextFormField(
                      controller: textcontroller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Enter what you need ...",
                        hintStyle:
                            TextStyle(fontSize: 14, color: Colors.grey[500]),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: postMessage,
                    icon: const Icon(Icons.arrow_circle_right_rounded, color: Colors.red,size: 50,),
                  )
                ],
                //post button
              ),
            ),

            //Logged in as

            Text(
              "Logged in as : " + currentUser.email!,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
