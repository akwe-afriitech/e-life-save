import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_life_saver/screens/donorreg2.dart';
import 'package:e_life_saver/screens/requestreg2.dart';
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
    Timer(Duration(seconds: 0),
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
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder:
          (context) =>
          donordash()
      ),
    );
  }
  donorreg() {
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder:
          (context) => donorreg2()
      ),
    );
  }
  request() {
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder:
          (context) =>
          receipdash()
      ),
    );
  }
  requestReg() {
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder:
          (context) =>
          requestreg2()
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
          return donorAccess(context);
        }
        return requestAccess(context);
      }
      print('Document does not exists on the database');
    });
  }
  donorAccess(BuildContext context){
    FirebaseFirestore.instance
        .collection('UserData')
        .doc(user?.uid)
        .collection('request')
        .limit(1)
        .get()
        .then((snapshot) {
      if (snapshot.size == null) {
        return donorreg();
      }
      else {
        return donor();
      }
    });

  }
  requestAccess(BuildContext context){
    FirebaseFirestore.instance
        .collection('UserData')
        .doc(user?.uid)
        .collection('request')
        .limit(1)
        .get()
        .then((snapshot) {
      if (snapshot.size == null ) {
        return requestReg();
      }
      else {
        return request();
      }
    });
  }
}



