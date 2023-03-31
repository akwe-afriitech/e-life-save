import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_life_saver/screens/init.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/donordash.dart';
import '../screens/receipdash.dart';

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

final user = FirebaseAuth.instance.currentUser;

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              FirebaseFirestore.instance
                  .collection('userData')
                  .doc(user?.uid)
                  .get()
                  .then((DocumentSnapshot documentSnapshot) {
                if (documentSnapshot.exists) {
                  if (documentSnapshot['role'] == 'donor') {
                    return donor();
                  }
                  return request();
                }
                print('Account does not exists in the database');
              });
              return Center(child: Container(
                width: 200,
                margin: const EdgeInsets.symmetric(horizontal:50),
                padding: const EdgeInsets.symmetric(vertical:50),

                child: ElevatedButton(
                  child: const Text('signout') ,
                  onPressed: (){
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context)=> const Center(child: CircularProgressIndicator(),)
                    );
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const init(),
                      ),
                    );

                  },
                ),

              ),) ;
            } else {
              return const init();
            }
          }),
    );
  }

  donor() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const donordash()),
    );
  }

  request() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const receipdash()),
    );
  }

  authacces(BuildContext context) {
    FirebaseFirestore.instance
        .collection('userData')
        .doc(user?.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot['role'] == 'donor') {
          return donor();
        }
        return request();
      }
      print('Account does not exists in the database');
    });
  }
}
