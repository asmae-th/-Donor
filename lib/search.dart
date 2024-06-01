import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List docIDs = [];
  List resultList = [];
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // getDocIDs();
    searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged() {
    print(searchController.text);
    searchResultList();
  }

  searchResultList() {
    var showResult = [];
    if (searchController.text != "") {
      for (var clientSnapShot in docIDs) {
        var name = clientSnapShot['blood type'].toString().toLowerCase();
        if (name.contains(searchController.text.toLowerCase())) {
          showResult.add(clientSnapShot);
        }
      }
    } else {
      showResult = List.from(docIDs);
    }
    setState(() {
      resultList = showResult;
    });
  }

  //Document IDs;

  getDocIDs() async {
    var data = await FirebaseFirestore.instance
        .collection('Users')
        .orderBy('blood type')
        .get();
    setState(() {
      docIDs = data.docs;
    });
    searchResultList();
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getDocIDs();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Athentification',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.red,
          title: CupertinoSearchTextField(
            itemSize: 50,
            prefixIcon: Icon(Icons.search),
            backgroundColor: Colors.white,
            controller: searchController,
          ),
        ),
        body: ListView.builder(
          itemCount: resultList.length,
          itemBuilder: (context, Index) {
            return ListTile(
              title: Text(resultList[Index]['blood type']),
              subtitle: Text(resultList[Index]['first name']),
              trailing: Text(resultList[Index]['phone']),
            );
          },
        ),
      ),
    );
  }
}



  // @override
  // void initState() {
  //   getDocIDs();
  //   super.initState();
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   _fetchUserData();
  // }

  // void _fetchUserData() {
  //   final user = FirebaseAuth.instance.currentUser!;
  //   final userId = user?.uid;

  //   FirebaseFirestore.instance.collection('users').doc(userId).get().then((snapshot) {
  //     final userData = snapshot.data();
  //     if (userData != null) {
  //       _nameController.text = userData['name'];
  //       _emailController.text = userData['email'];
  //     }
  //   });
  // }
