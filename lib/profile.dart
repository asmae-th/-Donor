import 'package:blood_donation/dossier1/get_user_name.dart';
import 'package:blood_donation/dossier1/text_box.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  final userscollection = FirebaseFirestore.instance.collection("Users");

  //edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          "Edit $field",
          style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          autocorrect: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.grey)),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          // cancel button
          TextButton(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),

          // save button
          TextButton(
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          )
        ],
      ),
    );
    // update in Firestore
    if (newValue.trim().length > 0) {
      //only update if there is somethingin the textfiles
      await userscollection.doc(user.email).update({field: newValue});
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              "Welcome to your Profile",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(user.email)
              .snapshots(),
          builder: (context, snapshot) {
            // get user data
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                children: [
                  //profile pic
                  SizedBox(
                    height: 25,
                  ),
                    Center(
                  widthFactor: 200,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("Images/profile.jpg"),
                        radius: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: 15,
                  ),
                  //Image.asset("Images/profile.jpg",alignment:Alignment.center,height: 150,width: 300),

                  // user email
                  Text(
                    user.email!,
                    textAlign: TextAlign.center,
                    // style: TextStyle()
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //user details
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "My details :",
                      style: TextStyle(color: Colors.grey[600],fontSize: 19),
                    ),
                  ),

                  // first name
                  MyTextBox(
                    text: userData['first name'],
                    sectionName: "first name",
                    onPressed: () => editField('first name'),
                  ),

                  //last name
                  MyTextBox(
                    text: userData['last name'],
                    sectionName: 'last name',
                    onPressed: () => editField('last name'),
                  ),

                  //user phone
                  MyTextBox(
                    text: userData['phone'],
                    sectionName: "Phone",
                    onPressed: () => editField('first name'),
                  ),
                  // city
                  MyTextBox(
                    text: userData['city'],
                    sectionName: "City",
                    onPressed: () => editField('city'),
                  ),
                  //blood type
                  MyTextBox(
                    text: userData['blood type'],
                    sectionName: "blood type",
                    onPressed: () => editField('blood type'),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error' + snapshot.error.toString()),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
        // Padding(
        //    padding: const EdgeInsets.all(20),
        // //   child: SingleChildScrollView(
        //      child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //          SizedBox(height: 20),
        //         Center(
        //           widthFactor: 200,
        //           child: Stack(
        //             children: [
        //               CircleAvatar(
        //                 radius: 50,
        //               ),
        //               Positioned(
        //                 bottom: -10,
        //                 right: -10,
        //                 child: IconButton.filled(
        //                   onPressed: () {},
        //                   icon: Icon(Icons.edit),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        // SizedBox(height: 20),

        // Expanded(
        //   child: FutureBuilder(
        //     future: getDocIDs(),
        //     builder: (context, snapshot){
        //     return ListView.builder(
        //   itemCount: docIDs.length,
        //   itemBuilder: (context, index) {
        //   return ListTile(
        //     title: GetUserName(documentId: docIDs[index]),
        //   );
        // });
        //   },
        //   )
        // ),

        // Card(
        //   child: ListTile(
        //     title: TextField(
        //       controller: _nameController,
        //       decoration: InputDecoration(
        //         labelText: "Name",
        //         border: InputBorder.none,
        //       ),
        //     ),
        //   ),
        // ),
        // SizedBox(height: 20),
        // Card(
        //   child: ListTile(
        //     title: TextField(
        //       // enabled: false,
        //       controller: _emailController,
        //       decoration: InputDecoration(
        //         labelText: "Email",
        //         border: InputBorder.none,
        //       ),
        //     ),
        //   ),
        // ),

        //   ],
        // ),

        //  ),

        //),

        );
  }
}
