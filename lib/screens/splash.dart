import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'donordash.dart';
import 'receipdash.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  final user = FirebaseAuth.instance.currentUser;


  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),
            () {
      authacces(context);

            }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Image(image:AssetImage('assets/logo.png'),),
          ),

        ),
      ),
    );
  }


  donor() {
    Navigator.push(context,
      MaterialPageRoute(builder:
          (context) =>
          donordash()
      ),);
  }
  request() {
    Navigator.push(context,
      MaterialPageRoute(builder:
          (context) =>
          receipdash()
      ),);
  }
  authacces(BuildContext context){
    FirebaseFirestore.instance
        .collection('userData')
        .doc(user?.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if(documentSnapshot['role']== 'donor'){
          return donor();
        }
        return request();
      }
      print('Document does not exists on the database');
    });

  }

}

