import 'package:blood_donation/coment.dart';
import 'package:blood_donation/comment_button.dart';
import 'package:blood_donation/dossier1/helper_method.dart';
import 'package:blood_donation/like.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final String message;
  final String User;
  final String postId;
  final List<String> likes;

  //final String time;
  Post(
      {super.key,
      required this.message,
      required this.User,
      required this.postId,
      required this.likes});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
// user
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  //comment text controller
  final commentTextController = TextEditingController();
  //count comment
  int count = 0;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  // toggle like
  void toggeleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    //Access the document is Firebase
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);
    if (isLiked) {
      //if the post is now liked add the user's email to the 'Likes' field

      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      //if the post is now unliked, remove the user's email to the 'Likes' field
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

//add comment
  void addComment(String commentText) {
    // write the comment to firebase
    FirebaseFirestore.instance
        .collection('User Posts')
        .doc(widget.postId)
        .collection("Comment")
        .add({
      'CommentText': commentText,
      'CommentBy': currentUser.email,
      'CommentTime': Timestamp.now(), //remember to format this when displaying
    });
  }

  //show a dialog box for adding comment
  void showCommentDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add comment"),
              content: TextField(
                controller: commentTextController,
                decoration: InputDecoration(hintText: "Write a comment ..."),
              ),
              actions: [
                //cancel button
                TextButton(
                    onPressed: () {
                      //pop box
                      Navigator.pop(context);
                      //decrement count
                      count--;

                      //clear controller
                      commentTextController.clear();
                    },
                    child: Text("Cancel")),
                //Post button
                TextButton(
                    onPressed: () {
                      //add comment
                      addComment(commentTextController.text);
                      // incremeny count
                      count++;
                      //pop box
                      Navigator.pop(context);

                      //clear controller
                      commentTextController.clear();
                    },
                    child: Text("Post")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100000,
      decoration: BoxDecoration(
        color: Colors.red[200],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //profile pic

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                 Row(
                  children: [
                     Container(
                              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey[400]),
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.person,
                                color: Colors.red,
                                ),
                            ),
                            SizedBox(width: 5,),
                      Text(
                        widget.User,
                        style: TextStyle(
                            fontSize: 13, color: const Color.fromARGB(255, 63, 58, 58)),
                      ),
                  ],
                 ),
              SizedBox(
                height: 25,
              ),
              Text(
                widget.message,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),

          SizedBox(
            width: 20,
          ),

          //bittons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Likes
              Column(
                children: [
                  //like button

                  Like(isLiked: isLiked, onTap: toggeleLike),

                  const SizedBox(height: 5),

                  //like count

                  Text(widget.likes.length.toString()),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              //Comment
              Column(
                children: [
                  //comment button

                  CommentButton(onTap: showCommentDialog),

                  const SizedBox(height: 5),

                  //comment count
                  Text("1"),
                  

                  // Text(widget.),
                ],
              ),
            ],
          ),
          // comment under the post
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("User Posts")
                .doc(widget.postId)
                .collection('Comment')
                .orderBy("CommentTime", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              //shw loading circle if no data yet
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                shrinkWrap: true, // for nested lists

                physics: const NeverScrollableScrollPhysics(),
                children: snapshot.data!.docs.map(
                  (doc) {
                    //get comment frome firebase
                    final CommentData = doc.data() as Map<String, dynamic>;
                    //return the comment
                    return Coment(
                      text: CommentData["CommentText"],
                      user: CommentData['CommentBy'],
                      time: formatDate(CommentData['CommentTime']),
                    );
                  },
                ).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

